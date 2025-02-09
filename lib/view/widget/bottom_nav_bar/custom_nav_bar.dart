import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class CustomMotionTabBar extends StatefulWidget {
  final Function(int) onTabItemSelected;
  const CustomMotionTabBar({super.key, required this.onTabItemSelected});

  @override
  State<CustomMotionTabBar> createState() => _CustomMotionTabBarState();
}

class _CustomMotionTabBarState extends State<CustomMotionTabBar>
    with TickerProviderStateMixin {
  late MotionTabBarController _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _motionTabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MotionTabBar(
      controller: _motionTabBarController,
      initialSelectedTab: "Home",
      labels: const ["B2B", "Home", "Profile"], // Updated labels
      icons: const [
        Icons.handshake,
        Icons.home,
        Icons.person_2_outlined
      ], // Updated icons

      tabSize: 50,
      tabBarHeight: 55,
      textStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      tabIconColor: Colors.blue[600],
      tabIconSize: 28.0,
      tabIconSelectedSize: 26.0,
      tabSelectedColor: Colors.blue[900],
      tabIconSelectedColor: Colors.white,
      tabBarColor: Colors.white,
      onTabItemSelected: (int value) {
        widget.onTabItemSelected(value);
        setState(() {
          _motionTabBarController.index = value;
        });
      },
    );
  }
}
