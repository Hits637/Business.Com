import 'dart:developer';

import 'package:business_dot_com/Controller/data_controller.dart';
import 'package:business_dot_com/Controller/session_data.dart';
import 'package:business_dot_com/view/Dashboard/Business_Registration/form1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainProfilePage extends StatefulWidget {
  final String? email;
  const MainProfilePage({super.key, required this.email});

  @override
  State<MainProfilePage> createState() => _MainProfilePageState();
}

class _MainProfilePageState extends State<MainProfilePage> {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  Future<void> _onRefresh() async {
    await DataController.fetchUserData(userId);
    //await DataController.fetchCompData();
    setState(() {});
  }

  void loadFetchUserData() async {
    await DataController.fetchUserData(userId);
  }

  void loadUserData() async {
    //await DataController.fetchUserData(userId);
    final emailId = SessionData.emailId;
    if (emailId != null) {
      bool isAdmin = await roleCheck(userId);
      String role = isAdmin ? "admin" : "user";
      log("Role: $role");
      await SessionData.storeSessionData(
        loginData: true,
        emailId: SessionData.emailId!,
        role: role,
      );
      log("Stored sesstion Role: ${SessionData.role}");
    } else {
      log("Error: SessionData.emailId is null");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //loadFetchUserData();
    //loadSessionData();
  }

  Future<void> loadSessionData() async {
    loadUserData();
    await SessionData.getSessionData();
    log("GetSessionData Role: ${SessionData.role}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: SessionData.role == "admin"
            ? Column(
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset('assets/svg/Light BG.svg'),
                      Column(children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    userCompList[0].compLogo,
                                    height: 150.h,
                                    width: 150.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  userCompList[0].organizationName!,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25.w,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ])
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: userCompList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8.0, left: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Text(
                                            userCompList[index]
                                                .pitchTextEditingController,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.w,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Text(
                                            userCompList[index]
                                                .descriptionTextEditingController,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15.w,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.edit),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            Get.defaultDialog(
                                              title: "Delete Confirmation!!!",
                                              titleStyle: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20.w,
                                                color: Colors.black,
                                              ),
                                              middleText:
                                                  "Are you sure you want to Delete?",
                                              middleTextStyle:
                                                  GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18.w,
                                                color: Colors.black,
                                              ),
                                              textConfirm: "Confirm",
                                              confirmTextColor: Colors.white,
                                              cancelTextColor: Colors.blue,
                                              textCancel: "Cancel",
                                              onConfirm: () async {
                                                log("$index");
                                                await deleteCompanyAndShift(
                                                    userId, index);
                                                userCompList.removeAt(index);
                                                await loadSessionData();
                                                //loadFetchUserData();
                                                setState(
                                                  () {},
                                                );
                                                Get.back();
                                              },
                                              onCancel: () {
                                                Get.back();
                                              },
                                            );
                                          },
                                          icon: const Icon(Icons.delete)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset('assets/svg/Light BG.svg'),
                      Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.width * 0.20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      "assets/images/CompanyLogo.jpg",
                                      height: 150.h,
                                      width: 150.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Text(
                                    "Register your Firm",
                                    style: const TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //log("$email");
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return RegistrationForm(email: widget.email);
              },
            ),
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          size: 45,
          color: Colors.blue,
        ),
      ),
    );
  }
}
