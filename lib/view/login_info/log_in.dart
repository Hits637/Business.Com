import "dart:developer";
import "package:business_dot_com/Controller/data_controller.dart";
import "package:business_dot_com/Controller/session_data.dart";
import "package:business_dot_com/model/b2b_model.dart";
import "package:business_dot_com/view/Dashboard/dashboard.dart";
import "package:business_dot_com/view/login_info/sign_up.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:google_fonts/google_fonts.dart";
import "../../model/comp_detail_model.dart";
import "../../Components/custom_snackbar.dart";

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  //vector shape
                  Image.asset(
                    height: 425.h,
                    width: 393.w,
                    "assets/login_and_signup/login_vector.png",
                    fit: BoxFit.cover,
                  ),
                  //3D img
                  SizedBox(
                    height: 431.h,
                    width: 393.w,
                    child: Image.asset(
                        "assets/login_and_signup/login_3Dimg.png",
                        fit: BoxFit.contain),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 400.h,
                      ),

                      Text("WELCOME",
                          style: GoogleFonts.roboto(
                            fontSize: 48,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(36, 89, 171, 1),
                          )),

                      Text(
                        'Sign in to access your account',
                        style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(134, 136, 139, 1)),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Container(
                        height: 42.h,
                        width: 305.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: TextField(
                          controller: emailTextEditingController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                            hintStyle: GoogleFonts.roboto(
                                fontSize: MediaQuery.of(context).size.width*0.042,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(119, 119, 119, 1)),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              size: 22.r,
                              color: const Color.fromRGBO(36, 89, 171, 1),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 12.w),
                            border: InputBorder.none, // No border at all
                          ),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      //Pass textField
                      Container(
                        height: 42.h,
                        width: 305.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: const Offset(1, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _passwordTextEditingController,
                          obscureText: isVisible, // Toggles password visibility
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            hintStyle: GoogleFonts.roboto(
                                fontSize: MediaQuery.of(context).size.width*0.042,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(119, 119, 119, 1)),
                            prefixIcon: Icon(
                              Icons
                                  .lock_outline, // Updated icon for better clarity
                              size: 22.r,
                              color: const Color.fromRGBO(36, 89, 171, 1),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                size: 22.r,
                                isVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.grey.shade700,
                              ),
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 12.w),
                            border: InputBorder
                                .none, // Match email field (No border)
                          ),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),

                      SizedBox(
                        height: 15.h,
                      ),

                      //Forget Password
                      Container(
                        width: 305.w,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forget password ?',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(36, 89, 171, 1)),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        height: 50.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            if (emailTextEditingController.text
                                    .trim()
                                    .isNotEmpty &&
                                _passwordTextEditingController.text
                                    .trim()
                                    .isNotEmpty) {
                              try {
                                UserCredential userCredential =
                                    await _firebaseAuth
                                        .signInWithEmailAndPassword(
                                  email: emailTextEditingController.text,
                                  password: _passwordTextEditingController.text,
                                );
                                log(userCredential.user!.email!);
                                emailTextEditingController.clear();
                                _passwordTextEditingController.clear();

                                String? email = userCredential.user?.email;

                                //setState(() {});
                                await SessionData.storeSessionData (
                                  loginData: true,
                                  emailId:emailTextEditingController.text,
                                  role:  "",
                                );
                                log("Session Data : ${SessionData.emailId}, ${SessionData.isLogin}");
                                log ("Role: ${SessionData.role}");
                              
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MainPage(email: email),
                                  ),
                                );
                              } on FirebaseAuthException catch (error) {
                                log("B2B: error code: ${error.code}");
                                log("B2B: error message: ${error.message}");
                                CustomSnackBar.showCustomSnackbar(
                                  title: error.code,
                                  message: "Please Enter the valid Data",
                                  // ignore: use_build_context_synchronously
                                );
                              }
                            } else {
                              CustomSnackBar.showCustomSnackbar(
                                  title: "Empty Fields...",
                                  message: "Please Enter The Data");
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: MediaQuery.of(context).size.width - 10,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                // colors for gradient
                                colors: [
                                  Color.fromRGBO(1, 31, 107, 1),
                                  Color.fromRGBO(70, 145, 232, 1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            child: Text(
                              "LOGIN",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),

                      //New Member? Register Now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New Member ? ',
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () async {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
                            child: Text(
                              'Register now',
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  color: const Color.fromRGBO(36, 89, 171, 1)),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 22.h,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 45.h,
                            width: 45.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                    color: Colors.grey,
                                  )
                                ]),
                            child: Center(
                                child: Image.asset(
                                    "assets/login_and_signup/google_icon.png")),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Container(
                            height: 45.h,
                            width: 45.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                    color: Colors.grey,
                                  )
                                ]),
                            child: Center(
                                child: Image.asset(
                                    "assets/login_and_signup/logo_facebook.png")),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Container(
                            height: 45.h,
                            width: 45.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                    color: Colors.grey,
                                  )
                                ]),
                            child: Center(
                                child: Image.asset(
                                    "assets/login_and_signup/x_logo.png")),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Container(
                            height: 45.h,
                            width: 45.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                    color: Colors.grey,
                                  )
                                ]),
                            child: Center(
                                child: Image.asset(
                                    "assets/login_and_signup/linkedin_logo.png")),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
