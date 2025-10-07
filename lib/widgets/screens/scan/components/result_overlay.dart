import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/blocks/detection/provider.dart';
import 'package:trash_classifier/config.dart';
import 'package:trash_classifier/ui/colors.dart';

import '../../../../blocks/test_mode/provider.dart';

class ResultOverlay extends StatelessWidget {
  const ResultOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DetectionProvider>();
    final state = provider.state;

    return Positioned.fill(
        child: IgnorePointer(
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
            child: AppConfig.isProd == true
                ? _buildOverlayForProd(context)
                : _buildOverlayForTest(context),
          ),
        )
    );
  }

  Widget _buildOverlayForProd(BuildContext context) {
    final provider = context.watch<DetectionProvider>();
    final state = provider.state;

    if(state.errorMessage != null) {
      return _buildErrorOverlay(state.errorMessage!);
    }

    if(state.isModelLoading) {
      return _buildProcessingOverlay();
    }

    if(state.isModelLoaded && state.label != null) {
      return _buildResultOverlay(state.label!, state.confidence!);
    }

    return const SizedBox.shrink(key: ValueKey('empty_prod'));
  }

  Widget _buildOverlayForTest(BuildContext context) {
    final provider = context.watch<TestCameraProvider>();

    if(provider.label != null && provider.confidence != null) {
      return _buildResultOverlay(provider.label!, provider.confidence!);
    }

    if(provider.isProcessing) {
      return _buildProcessingOverlay();
    }

    return const SizedBox.shrink(key: ValueKey('empty_test'));
  }

  Widget _buildResultOverlay(String label, double confidence) {
    final confidencePercent = (confidence * 100).toStringAsFixed(1);

    return Align(
      key: ValueKey(label),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(12),
            ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Результат: $label ($confidencePercent%)',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProcessingOverlay() {
    return Container(
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

  Widget _buildErrorOverlay(String message) {
    return Container(
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