import "dart:developer";
import "package:business_dot_com/view/login_info/log_in.dart";
import "package:business_dot_com/view/widget/custom_snackbar.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

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
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SizedBox(
              height: 360,
              width: 500,
              child: Image.asset("assets/images/Vector (4).png",
                  fit: BoxFit.cover)),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Center(
                    child: SizedBox(
                      height: 250,
                      width: 300,
                      child: Image.asset(
                        "assets/images/log_signin_bg.png",
                        //fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GradientText(
                    "Get Started",
                    style: const TextStyle(
                        fontSize: 27.0, fontWeight: FontWeight.bold),
                    colors: const [
                      Color.fromARGB(255, 0, 45, 81),
                      Color.fromARGB(255, 0, 144, 247),
                    ],
                  ),
                  const Text(
                    'by creating a free account',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),

                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 218, 229, 242)
                                .withOpacity(1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(5, 8),
                          )
                        ]),
                    child: TextField(
                      controller: _emailTextEditingController,
                      decoration: InputDecoration(
                        //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                        //fillColor: const Color.fromARGB(255, 204, 220, 248),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Enter your email',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        prefixIcon: const Icon(Icons.email_outlined),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 1.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(30),
                  //       color: Colors.white,
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: const Color.fromARGB(255, 218, 229, 242)
                  //               .withOpacity(1),
                  //           spreadRadius: 1,
                  //           blurRadius: 5,
                  //           offset: const Offset(5, 8),
                  //         )
                  //       ]),
                  //   child: TextField(
                  //     controller: _numberTextEditingController,
                  //     decoration: InputDecoration(
                  //       labelText: 'Phone number',
                  //       labelStyle: const TextStyle(
                  //         color: Colors.grey,
                  //       ),
                  //       fillColor: Colors.white,
                  //       filled: true,
                  //       prefixIcon: const Icon(Icons.phone_android_outlined),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderSide:
                  //             const BorderSide(color: Colors.blue, width: 1.5),
                  //         borderRadius: BorderRadius.circular(30),
                  //       ),
                  //     ),
                  //     style: const TextStyle(fontSize: 18, color: Colors.black),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.02,
                  // ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 218, 229, 242)
                                .withOpacity(1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(5, 8),
                          )
                        ]),
                    child: TextField(
                      controller: _passwordTextEditingController,
                      obscureText:
                          isVisiblePass, // Controls password visibility
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(Icons.lock_clock_outlined),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isVisiblePass
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              isVisiblePass = !isVisiblePass;
                            });
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 1.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 218, 229, 242)
                                .withOpacity(1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(5, 8),
                          )
                        ]),
                    child: TextField(
                      controller: _confirmPassword,
                      obscureText:
                          isVisibleConfirmPass, // Controls password visibility
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(Icons.lock_clock_outlined),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isVisibleConfirmPass
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              isVisibleConfirmPass = !isVisibleConfirmPass;
                            });
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 1.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  //const Spacer(),
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
                          _passwordTextEditingController.text
                              .trim()
                              .isNotEmpty) {
                        try {
                          UserCredential userCredential = await _firebaseAuth
                              .createUserWithEmailAndPassword(
                                  email:
                                      _emailTextEditingController.text.trim(),
                                  password: _passwordTextEditingController.text
                                      .trim());
                          log("User Credential : $userCredential");
                          CustomSnackBar.showCustomSnackbar(
                            message: "User Register Successfully",
                            context: context,
                          );
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()));
                        } on FirebaseAuthException catch (error) {
                          print("${error.code}");
                          print("${error.message}");
                          CustomSnackBar.showCustomSnackbar(
                            message: error.message!,
                            context: context,
                          );
                        }
                      } else {
                        CustomSnackBar.showCustomSnackbar(
                          message: "Please enter valid fields",
                          context: context,
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          // colors for gradient
                          colors: [
                            Color.fromARGB(255, 0, 45, 81),
                            Color.fromARGB(255, 0, 144, 247),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          'Signup',
                          style: GoogleFonts.abhayaLibre(
                            textStyle: TextStyle(
                                fontSize: screenWidth * 0.07,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a member? ',
                        style: TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()));
                          setState(() {});
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
