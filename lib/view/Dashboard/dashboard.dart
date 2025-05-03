import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:business_dot_com/Controller/data_controller.dart';
import 'package:business_dot_com/Controller/session_data.dart';
import 'package:business_dot_com/view/Dashboard/Functionalities/B2B/b2b_page.dart';
import 'package:business_dot_com/view/Dashboard/Functionalities/ProfilePage/main_profile_page.dart';
import 'package:business_dot_com/view/Dashboard/Functionalities/ProfilePage/profile_page.dart';
import 'package:business_dot_com/view/widget/bottom_nav_bar/custom_nav_bar.dart';

import 'package:business_dot_com/view/Dashboard/Functionalities/widget/dashbard_listview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:business_dot_com/view/Dashboard/Business_Registration/form1.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String? email;
  const MainPage({super.key, this.email});
  @override
  State<MainPage> createState() => _MainPageState(email: email);
}

class _MainPageState extends State<MainPage> {
  String? email;
  _MainPageState({this.email});
  final _pageController = PageController(initialPage: 1);
  final _controller = NotchBottomBarController(index: 1);
  int maxCount = 3;
  String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    log("in InitState");
    log("$userId");
    // TODO: implement initState
    super.initState();
    loadCompData();
    loadFetchUserData();
    loadSessionData();
    loadUserData();
  }

  void loadFetchUserData() async {
    await DataController.fetchUserData(userId);
  }

  void loadSessionData() async {
    await SessionData.getSessionData();
  }

  void loadUserData() async {
    //await DataController.fetchUserData(userId);
    await SessionData.storeSessionData(
        loginData: true,
        emailId: SessionData.emailId!,
        role: (await roleCheck(userId)) == true? "admin" : "user");
        log("${SessionData.role}");
  }
  // Future<void> _refresh() async{
  //   await DataController.fetchCompData();
  // }
  void loadCompData()async{
    await DataController.fetchCompData();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bottomBarPages = [
      const B2b(),
      HomePageController(
        email: email,
      ),
       MainProfilePage(email: widget.email!),
    ];
    return Scaffold(
      //drawer: const DrawerPage(),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _controller.index = index; // Sync the controller index
          });
        },
        children: bottomBarPages,
      ),
      bottomNavigationBar: CustomMotionTabBar(
        onTabItemSelected: (int index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
