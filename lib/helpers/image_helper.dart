import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;

class ImageHelper {
  final int inputSize;
  final bool isQuantized; // if model is float32 - false, int8 - true

  ImageHelper({
    this.inputSize = 224,
    this.isQuantized = true
});

  /// Convert CameraImage to Image (YUV => RGB)
  img.Image convertCameraImageToImage(CameraImage cameraImage) {
    final width = cameraImage.width;
    final height = cameraImage.height;

    final convertedImage = img.Image(width: width, height: height);

    final uvRowStep = cameraImage.planes[1].bytesPerRow;
    final uvPixelStep = cameraImage.planes[1].bytesPerPixel;

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final uvIndex = uvPixelStep! * (x ~/ 2) + uvRowStep * (y ~/ 2);

        final yValue = cameraImage.planes[0].bytes[y * cameraImage.planes[0].bytesPerRow + x];
        final uValue = cameraImage.planes[1].bytes[uvIndex];
        final vValue = cameraImage.planes[2].bytes[uvIndex];

        int r = (yValue + vValue * 1436 / 1024 - 179).round().clamp(0, 255);
        int g = (yValue - uValue * 46549 / 131072 + 44 - vValue * 93604 / 131072 + 91).round().clamp(0, 255);
        int b = (yValue + uValue * 1814 / 1024 - 227).round().clamp(0, 255);

        convertedImage.setPixelRgba(x, y, r, g, b, 255);
      }
    }

    return convertedImage;
  }

  /// Resize image to model input size
  img.Image resizeImage(img.Image image) {
    return img.copyResize(image, width: inputSize, height: inputSize);
  }

  dynamic imageToByteList(img.Image image) {
   if(isQuantized) {
      return _imageToUint8(image);
    } else {
      return _imageToFloat32(image);
    }

  }

  Uint8List _imageToUint8(img.Image image) {
    final int length = inputSize * inputSize * 3;
    final Uint8List buffer = Uint8List(length);
    int idx = 0;

    for (int y = 0; y < inputSize; y++) {
      for (int x = 0; x < inputSize; x++) {
        final pixel = image.getPixel(x, y);

        buffer[idx++] = pixel.r.toInt();
        buffer[idx++] = pixel.g.toInt();
        buffer[idx++] = pixel.b.toInt();
      }
    }

    return buffer;
  }

  Float32List _imageToFloat32(img.Image image) {
    final int length = inputSize * inputSize * 3;
    final Float32List buffer = Float32List(length);
    int idx = 0;

    for (int y = 0; y < inputSize; y++) {
      for (int x = 0; x < inputSize; x++) {
        final pixel = image.getPixel(x, y);

        buffer[idx++] = pixel.r / 255.0;
        buffer[idx++] = pixel.g / 255.0;
        buffer[idx++] = pixel.b / 255.0;
      }
    }

    return buffer;
  }

  List preprocess(CameraImage cameraImage) {
    final rgb = convertCameraImageToImage(cameraImage);
    final resized = resizeImage(rgb);
    return imageToByteList(resized);
  }


}