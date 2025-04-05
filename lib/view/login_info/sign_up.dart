import "dart:developer";
import "package:business_dot_com/view/login_info/log_in.dart";
import "package:business_dot_com/Components/custom_snackbar.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "package:google_fonts/google_fonts.dart";
import "package:simple_gradient_text/simple_gradient_text.dart";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _numberTextEditingController =
      TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool isVisiblePass = true;
  bool isVisibleConfirmPass = true;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //Vector shape
            SizedBox(
                height: 425.h,
                width: 393.w,
                child: Image.asset("assets/login_and_signup/signup_vector.png",
                    fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                height: 343.h,
                width: 393.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "GET",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "STARTED",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Create your Account",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 6.r, right: 30.r, left: 1.r),
                  child: SizedBox(
                    child: Image.asset(
                      height: 500.h,
                      width: 364.h,
                      fit: BoxFit.cover,
                      "assets/login_and_signup/signup_3Dimg.png",
                    ),
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.sizeOf(context).height / 2.1,
                // ),

                Container(
                  height: 42.h,
                  width: 305.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        10.r), // Rounded corners for smooth UI
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _emailTextEditingController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Email',
                      labelStyle: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(119, 119, 119, 1)),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 22.r,
                        color: Color.fromRGBO(36, 89, 171, 1),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 12.w),
                      border: InputBorder.none, // No border at all
                    ),
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),

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
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _passwordTextEditingController,
                    obscureText: isVisiblePass, // Toggles password visibility
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Password',
                      labelStyle: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(119, 119, 119, 1)),
                      prefixIcon: Icon(
                        Icons.lock_outline, // Updated icon for better clarity
                        size: 22.r,
                        color: Color.fromRGBO(36, 89, 171, 1),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          size: 22.r,
                          isVisiblePass
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.grey.shade700,
                        ),
                        onPressed: () {
                          setState(() {
                            isVisiblePass = !isVisiblePass;
                          });
                        },
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 12.w),
                      border: InputBorder.none, // Match email field (No border)
                    ),
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 42.h,
                  width: 305.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _confirmPassword,
                    obscureText:
                        isVisibleConfirmPass, // Toggles password visibility
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Confirm Password',
                      labelStyle: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(119, 119, 119, 1)),
                      prefixIcon: Icon(
                        Icons.lock_outline, // Updated icon for better clarity
                        size: 22.r,
                        color: Color.fromRGBO(36, 89, 171, 1),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          size: 22.r,
                          isVisibleConfirmPass
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.grey.shade700,
                        ),
                        onPressed: () {
                          setState(() {
                            isVisibleConfirmPass = !isVisibleConfirmPass;
                          });
                        },
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 12.w),
                      border: InputBorder.none, // Match email field (No border)
                    ),
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),

                GestureDetector(
                  onTap: () async {
                    if (_numberTextEditingController.text.trim().isNotEmpty) {
                      Map<String, dynamic> data = {
                        // "Mo. Number ":
                        //     _numberTextEditingController.text.trim(),
                        "Email ": _emailTextEditingController.text.trim(),
                      };
                      FirebaseFirestore.instance
                          .collection("CompanyDetails")
                          .doc("$_emailTextEditingController")
                          .set(data);
                    }
                    if (_emailTextEditingController.text.trim().isNotEmpty &&
                        _passwordTextEditingController.text.trim().isNotEmpty &&
                        _passwordTextEditingController.text ==
                            _confirmPassword.text) {
                      try {
                        UserCredential userCredential =
                            await _firebaseAuth.createUserWithEmailAndPassword(
                                email: _emailTextEditingController.text.trim(),
                                password:
                                    _passwordTextEditingController.text.trim());
                        log("User Credential : $userCredential");
                        CustomSnackBar.showCustomSnackbar(
                          title: "Congratulatins!!!",
                          message: "Registration Succesfull...",
                        );
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const LogIn()));
                      } on FirebaseAuthException catch (error) {
                        log("${error.code}");
                        log("${error.message}");
                        CustomSnackBar.showCustomSnackbar(
                          title: error.code,
                          message: error.message!,
                        );
                      }
                    } else {
                      CustomSnackBar.showCustomSnackbar(
                        title: "Oppsss...",
                        message: "Please enter valid fields",
                      );
                    }
                  },
                  child: Container(
                    height: 50.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        // colors for gradient
                        colors: [
                          Color.fromRGBO(1, 31, 107, 1),
                          Color.fromRGBO(70, 145, 232, 1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        'Signup',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a Member ? ',
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogIn()));
                        setState(() {});
                      },
                      child: Text(
                        'Log In',
                        style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: Color.fromRGBO(36, 89, 171, 1)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
