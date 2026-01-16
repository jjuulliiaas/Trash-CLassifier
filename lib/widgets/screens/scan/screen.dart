import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/generated/l10n.dart';
import '../../../blocks/camera_controller/repository.dart';
import '../../../blocks/detection/provider.dart';
import '../../../blocks/statistics/provider.dart';
import '../../../config.dart';
import '../../../helpers/image_helper.dart';
import '../../../services/tflite_service.dart';
import '../../../ui/fonts.dart';
import '../../common/snack_bar.dart';
import 'body.dart';
import 'components/icon_button.dart';
import 'controller.dart';

class ScanScreen extends StatefulWidget{
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  ScanController? _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initController());
  }

  Future<void> _initController() async {
    try {
      final tfliteService = TFLiteService();

      if (AppConfig.isProd) {
        await tfliteService.loadModel();
      }

      final detectionProvider = context.read<DetectionProvider>();

      final controller = ScanController(
        detectionProvider: detectionProvider,
        tfLiteService: tfliteService,
        imageHelper: ImageHelper(),
        cameraRepo: CameraRepository(),
      );

      if (AppConfig.isProd) {
        final cameras = await availableCameras();
        if (cameras.isNotEmpty) {
          await controller.initCamera(cameras.first);
          if (controller.cameraController!.value.isInitialized) {
            await controller.startStream();
            detectionProvider.setCameraReady(true);
          }
        }
      } else {
        detectionProvider.setCameraReady(true);
      }

      if (mounted) {
        setState(() {
          _controller = controller;
          _isLoading = false;
        });
      }
    } catch (e) {
      print("Error initializing scan controller: $e");
      if(mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _onSaveTap() async {
    if (_controller == null) return;

    final $ = S.of(context);
    final uid = FirebaseAuth.instance.currentUser?.uid ?? '';

      await _controller!.saveResult();

      if (mounted && uid.isNotEmpty) {
        context.read<StatisticsProvider>().loadStatistics(uid, 0);
      }

      AppSnackBar.show(context, text: $.savedSuccessfully);

  }

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            $.scanTrash,
          style: AppFonts.buildScreenHeading(),
        ),
        centerTitle: true,
        actionsPadding: const EdgeInsets.all(8.0),
        leading: CIconButton(
          onIconTap: () => Navigator.pop(context),
          icon: const Icon(
              FluentIcons.chevron_left_20_filled,
          ),
        ),
        actions: <Widget>[
          CIconButton(
            onIconTap: _onSaveTap,
            icon: const Icon(
              FluentIcons.checkmark_32_filled,
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ScanBody(controller: _controller),
    );
  }
}