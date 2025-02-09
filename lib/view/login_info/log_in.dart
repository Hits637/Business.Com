import "dart:developer";

import "package:business_dot_com/model/b2b_model.dart";
import "package:business_dot_com/view/Dashboard/dashboard.dart";
import "package:business_dot_com/view/login_info/sign_up.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:simple_gradient_text/simple_gradient_text.dart";

import "../../model/comp_detail_model.dart";
import "../widget/custom_snackbar.dart";

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
    //final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                // height: MediaQuery.sizeOf(context).height / 2,
                child: Image.asset(
                  "assets/login_and_signup/login_vector.png",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.13,
                    ),
                    SizedBox(
                      height: 250,
                      width: 300,
                      child: Image.asset("assets/images/log_signin_bg.png"),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    // GradientText(
                    //   "Welcome",
                    //   style: const TextStyle(
                    //       fontSize: 48.0, fontWeight: FontWeight.bold),
                    //   // colors: const [
                    //   //   Color.fromARGB(255, 0, 45, 81),
                    //   //   Color.fromARGB(255, 0, 144, 247),
                    //   // ],
                    // ),
                    Text("WELCOME",
                        style: GoogleFonts.roboto(
                          fontSize: 48,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(36, 89, 171, 1),
                        )),
                    Text(
                      'Sign in to access your account',
                      style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(134, 136, 139, 1)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      height: 42,
                      width: 305,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            blurRadius: 4,
                            offset: Offset(0, 2)),
                      ]),
                      child: TextField(
                        controller: emailTextEditingController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          filled: true,
                          labelText: 'Enter your email',
                          labelStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(Icons.email_outlined),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
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
                        obscureText: isVisible, // Controls password visibility
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(Icons.lock_clock_outlined),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                          ),
                        ),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            // Handle forgot password
                          },
                          child: const Text(
                            'Forget password?',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 130, 164, 202)
                                  .withOpacity(1),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset: const Offset(5, 8),
                            )
                          ]),
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

                              QuerySnapshot response = await FirebaseFirestore
                                  .instance
                                  .collection("CompanyDetails")
                                  .get();

                              log("Total documents: ${response.docs.length}");

                              Map<String, int> domainIndexMap = {};
                              for (int i = 0; i < domainList.length; i++) {
                                domainIndexMap[domainList[i]] = i;
                              }

                              for (int i = 0; i < response.docs.length; i++) {
                                // Extract and validate the domain
                                String? domain = response.docs[i]["Domain"];
                                if (domain == null || domain.isEmpty) {
                                  log("Document missing Domain field. Skipping...");
                                  continue;
                                }

                                // Check if the domain is already in the set
                                int? domainIndex = domainIndexMap[domain];
                                if (domainIndex == null) {
                                  // New domain found
                                  domainSet.add(domain);
                                  domainList.add(domain);
                                  domainIndex = domainList.length -
                                      1; // Index of the new domain
                                  majorCompDetailModelList
                                      .add([]); // Add new list for this domain
                                  domainIndexMap[domain] = domainIndex;
                                }

                                // Add the document to the correct list
                                majorCompDetailModelList[domainIndex].add(
                                  CompDetailModel(
                                      organizationName: response.docs[i]
                                              ['OrganizationName'] ??
                                          'N/A',
                                      city: response.docs[i]['city'] ?? 'N/A',
                                      pitchTextEditingController:
                                          response.docs[i]['pitch'] ?? 'N/A',
                                      revenue:
                                          response.docs[i]['Revenue'] ?? 'N/A',
                                      compLogo:
                                          response.docs[i]['CompLogo'] ?? 'N/A',
                                      ownerName: response.docs[i]['OwnerName'] ??
                                          'N/A',
                                      domain:
                                          response.docs[i]['Domain'] ?? 'N/A',
                                      organizationType: response.docs[i]
                                              ['Organization Type'] ??
                                          'N/A',
                                      establishmentYear: response.docs[i]
                                              ['Establishment Year'] ??
                                          'N/A',
                                      gstinNo:
                                          response.docs[i]['GSTIN No'] ?? 'N/A',
                                      address:
                                          response.docs[i]['Address'] ?? 'N/A',
                                      state: response.docs[i]['state'] ?? 'N/A',
                                      descriptionTextEditingController:
                                          response.docs[i]['Description'] ??
                                              'N/A',
                                      partnerSkills: response.docs[i]['Skills'] ?? 'N/A',
                                      websiteTextEditingController: response.docs[i]['Website'] ?? 'N/A',
                                      partnerMinQualification: response.docs[i]['Min Qualification'] ?? 'N/A',
                                      partnerRequirment: response.docs[i]['Requirement'] ?? 'N/A',
                                      partnerStakes: response.docs[i]['stake'],
                                      investmentRange: response.docs[i]['investmentRange'] ?? "N/a",
                                      mobileNo: response.docs[i]['mobileNo'] ?? 'N/A'),
                                );
                              }
                              QuerySnapshot b2bResponse =
                                  await FirebaseFirestore.instance
                                      .collection("B2B Details")
                                      .get();

                              for (int i = 0;
                                  i < b2bResponse.docs.length;
                                  i++) {
                                b2bDetailList.add(
                                  B2bModel(
                                      organizationName: b2bResponse.docs[i]
                                              ['organizationName'] ??
                                          'N/A',
                                      ownerName: b2bResponse.docs[i]['ownerName'] ??
                                          'N/A',
                                      domain: b2bResponse.docs[i]['domain'] == ""
                                          ? "N/A"
                                          : b2bResponse.docs[i]['domain'],
                                      organizationType: b2bResponse.docs[i]
                                              ['organizationType'] ??
                                          'N/A',
                                      businessColab: b2bResponse.docs[i]
                                              ['businessColab'] ??
                                          'N/A',
                                      gstinNo: b2bResponse.docs[i]['gstinNo'] ??
                                          'N/A',
                                      moneyOffered: b2bResponse.docs[i]
                                              ['moneyOffered'] ??
                                          'N/A',
                                      employeerequire: b2bResponse.docs[i]
                                              ['employeerequire'] ??
                                          'N/A',
                                      address:
                                          b2bResponse.docs[i]['address'] ?? 'N/A',
                                      colabwithBusiness: b2bResponse.docs[i]['colabwithBusiness'] ?? 'N/A',
                                      colabarationType: b2bResponse.docs[i]['colabarationType'] ?? 'N/A',
                                      city: b2bResponse.docs[i]['city'] ?? 'N/A',
                                      state: b2bResponse.docs[i]['state'] ?? 'N/A',
                                      compLogo: b2bResponse.docs[i]['compLogo'] ?? 'N/A'),
                                );
                              }

                              log("Final majorCompDetailModelList: $majorCompDetailModelList");

                              setState(() {});
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPage(email: email),
                                ),
                              );
                            } on FirebaseAuthException catch (error) {
                              log("B2B: error code: ${error.code}");
                              log("B2B: error message: ${error.message}");
                              CustomSnackBar.showCustomSnackbar(
                                message: error.code,
                                // ignore: use_build_context_synchronously
                                context: context,
                              );
                            }
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 10,
                          height: 60,
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
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'New Member? ',
                          style: TextStyle(
                              fontSize: 12,
                              //fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: const Text(
                            'Register now',
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
            ],
          ),
        ),
      ),
    );
  }
}
