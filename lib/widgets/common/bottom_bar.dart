import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:trash_classifier/routes.dart';

class CBottomBar extends StatelessWidget{
  const CBottomBar({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        switch(index) {
          case 0:
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          case 1:
            Navigator.pushReplacementNamed(context, AppRoutes.scan);
          case 2:
            Navigator.pushReplacementNamed(context, AppRoutes.account);
        }
      },
      currentIndex: currentIndex,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.blueGrey,
      iconSize: 30,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            FluentIcons.home_20_regular,
           ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              FluentIcons.scan_camera_20_regular,
            size: 50,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(FluentIcons.person_wrench_20_regular),
          label: '',
        ),
      ],
    );
  }

}