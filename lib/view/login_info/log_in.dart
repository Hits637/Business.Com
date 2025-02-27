import "dart:developer";
import "package:business_dot_com/model/b2b_model.dart";
import "package:business_dot_com/view/Dashboard/dashboard.dart";
import "package:business_dot_com/view/login_info/sign_up.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:google_fonts/google_fonts.dart";
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
                          style: TextStyle(fontSize: 16, color: Colors.black),
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
                            labelStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(119, 119, 119, 1)),
                            prefixIcon: Icon(
                              Icons
                                  .lock_outline, // Updated icon for better clarity
                              size: 22.r,
                              color: Color.fromRGBO(36, 89, 171, 1),
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
                          style: TextStyle(fontSize: 16, color: Colors.black),
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
                                color: Color.fromRGBO(36, 89, 171, 1)),
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
                                    majorCompDetailModelList.add(
                                        []); // Add new list for this domain
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
                                        revenue: response.docs[i]['Revenue'] ??
                                            'N/A',
                                        compLogo: response.docs[i]['CompLogo'] ??
                                            'N/A',
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
                                        gstinNo: response.docs[i]['GSTIN No'] ??
                                            'N/A',
                                        address:
                                            response.docs[i]['Address'] ?? 'N/A',
                                        state: response.docs[i]['state'] ?? 'N/A',
                                        descriptionTextEditingController: response.docs[i]['Description'] ?? 'N/A',
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
                                        ownerName: b2bResponse.docs[i]
                                                ['ownerName'] ??
                                            'N/A',
                                        domain:
                                            b2bResponse.docs[i]['domain'] == ""
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
                                        address: b2bResponse.docs[i]['address'] ?? 'N/A',
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
                                    builder: (context) =>
                                        MainPage(email: email),
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
                                color: Color.fromRGBO(255, 255, 255, 1),
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
                                  color: Color.fromRGBO(36, 89, 171, 1)),
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
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
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
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
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
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
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
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
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
