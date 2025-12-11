import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/blocks/detection/provider.dart';
import 'package:trash_classifier/blocks/trash_category/model.dart';
import 'package:trash_classifier/config.dart';
import 'package:trash_classifier/ui/colors.dart';
import 'package:trash_classifier/ui/extensions/category_extension.dart';

import '../../../../blocks/test_mode/provider.dart';
import '../../../../ui/fonts.dart';

class ResultOverlay extends StatelessWidget {
  const ResultOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DetectionProvider>();
    final state = provider.state;

    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.7;

    return Positioned.fill(
        child: IgnorePointer(
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
            child: AppConfig.isProd == true
                ? _buildOverlayForProd(context, containerWidth)
                : _buildOverlayForTest(context, containerWidth),
          ),
        )
    );
  }

  Widget _buildOverlayForProd(BuildContext context, double containerWidth) {
    final provider = context.watch<DetectionProvider>();
    final state = provider.state;

    if(state.errorMessage != null) {
      return _buildErrorOverlay(state.errorMessage!, containerWidth);
    }

    if(state.isModelLoading) {
      return _buildProcessingOverlay(containerWidth);
    }

    if(state.isModelLoaded && state.label != null) {
      return _buildResultOverlay(context, state.label!, state.confidence!, containerWidth);
    }

    return const SizedBox.shrink(key: ValueKey('empty_prod'));
  }

  Widget _buildOverlayForTest(BuildContext context, double containerWidth) {
    final provider = context.watch<TestCameraProvider>();

    if(provider.label != null && provider.confidence != null) {
      return _buildResultOverlay(context, provider.label!, provider.confidence!, containerWidth);
    }

    if(provider.isProcessing) {
      return _buildProcessingOverlay(containerWidth);
    }

    return const SizedBox.shrink(key: ValueKey('empty_test'));
  }

  Widget _buildResultOverlay(BuildContext context, String label, double confidence, double containerWidth) {
    final confidencePercent = (confidence * 100).toStringAsFixed(1);
    final category = categoryFromLabel(label);
    final name = category.name(context);
    final iconColor = category.labelColor;
    final categoryColor = category.categoryColor;

    return Align(
      key: ValueKey(label),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedContainer(
          width: containerWidth,
            duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: categoryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(scale: animation, child: child);
                        },
                      ),
                      const SizedBox(width: 8,),
                      Text(
                        name.toUpperCase(),
                        style: AppFonts.buildCategoryHeading(
                            color: iconColor
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$confidencePercent%',
                    style: AppFonts.buildConfidencePercent(
                        color: iconColor
                    ),
                  ),
                  const SizedBox(height: 16,),
                  // Text(
                  //   tagline,
                  //   style: AppFonts.buildCategoryDescription(
                  //       color: iconColor
                  //   ),
                  //   textAlign: TextAlign.center,
                  // )
                ],
              ),
        ),
      ),
    );
  }

  Widget _buildProcessingOverlay(double containerWidth) {
    return Container(
      width: containerWidth,
      color: AppColors.primaryGreen,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text('Processing...', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildErrorOverlay(String message, double containerWidth) {
    return Container(
      width: containerWidth,
      key: const ValueKey('error'),
      color: Colors.red,
      alignment: Alignment.center,
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}