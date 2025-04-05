import 'dart:developer';

import 'package:business_dot_com/Controller/session_data.dart';
import 'package:business_dot_com/view/Dashboard/Drawer/About_Us/about_us.dart';
import 'package:business_dot_com/view/Dashboard/Drawer/Gov_Schemes/all_scheme_chatagory.dart';
import 'package:business_dot_com/view/Dashboard/Drawer/Help&Support/help_and_support.dart';
import 'package:business_dot_com/view/Dashboard/Drawer/News/news_screen.dart';
import 'package:business_dot_com/view/login_info/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    await SessionData.getSessionData();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300.w,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      child: Stack(
        children: [
          SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset("assets/drawer/drawer_vector.png",
                  fit: BoxFit.cover)),
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height / 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      'BUSINESS.COM',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AllSchemeChatagory()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(
                            Icons.account_balance_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Government Schemes",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => NewsScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(
                            Icons.newspaper_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "News Section",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HelpPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(
                            Icons.help,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Help",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AboutUsPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(
                            Icons.info,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "About Us",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  SessionData.storeSessionData(
                      loginData: false, emailId: SessionData.emailId!);
                  log("${SessionData.emailId}");
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const LogIn()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(
                            Icons.logout,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "LogOut",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
