import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:trash_classifier/routes.dart';

import '../../ui/colors.dart';

class CBottomBar extends StatelessWidget{
  const CBottomBar({super.key, required this.currentIndex});

  final int currentIndex;

  void _onItemTapped(BuildContext context, int index) {
    switch(index) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, AppRoutes.scan);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, AppRoutes.account);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildItem(
              context,
              index: 0,
              icon: FluentIcons.home_28_regular,
              activeIcon: FluentIcons.home_28_filled,
            ),
            _buildItem(
                context,
                index: 1,
                icon: FluentIcons.scan_camera_28_regular,
                size: 50
            ),
            _buildItem(
              context,
              index: 2,
              icon: FluentIcons.person_28_regular,
              activeIcon: FluentIcons.person_28_filled,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, {
        required int index,
        required IconData icon,
        IconData? activeIcon,
        double size = 35.0
      }
      ) {

    final bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(context, index),
      child: SizedBox(
        width: 70,
        height: 70,
        child: Center(
          child: Icon(
            isActive && activeIcon != null ? activeIcon : icon,
            size: size,
            color: isActive ? AppColors.primaryGreen : AppColors.primaryGrey,
          ),
        ),
      ),
    );
  }

}