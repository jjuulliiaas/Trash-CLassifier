import 'package:flutter/material.dart';
import 'package:trash_classifier/ui/colors.dart';

class CIconButton extends StatelessWidget {
  const CIconButton({
    super.key,
    required this.icon,
    required this.onIconTap,
    Color color = AppColors.primaryGrey,
    double iconSize = 25.0,
  });

  final Icon icon;
  final void Function() onIconTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onIconTap,
        icon: icon,
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
    );
  }
}