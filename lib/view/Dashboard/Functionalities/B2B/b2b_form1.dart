//import 'package:business_dot_com/view/Dashboard/Business_Registration/widget/partner_finish_button.dart';
import 'dart:developer';
import 'dart:io';

//import 'package:b2b/b2b/b2b.dart';
import 'package:business_dot_com/Controller/comp_image_dao.dart';
import 'package:business_dot_com/view/Dashboard/Functionalities/B2B/widgets/submitbutton.dart';
import 'package:business_dot_com/view/Dashboard/Functionalities/B2B/widgets/texteditingcontroller.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:intl/intl.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'b2b_page.dart';

XFile? companyImage;

class B2bRegistrationForm extends StatefulWidget {
  final String? email;

  const B2bRegistrationForm({super.key, this.email});

  @override
  // ignore: no_logic_in_create_state
  State<B2bRegistrationForm> createState() =>
      _RegistrationFormState(email: email);
}

class _RegistrationFormState extends State<B2bRegistrationForm> {
  String? email;
  _RegistrationFormState({this.email});
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    void uploadNdDownloadImage() async {
      String fileName = companyImage!.name + DateTime.now().toString();

      await CompImageDao.uploadImage(
          fileName: fileName, folderName: "B2b", companyImage: companyImage!);

      url = await CompImageDao.downloadImageUrl(
          fileName: fileName, folderName: "B2b");
      companyImage = null;
    }

    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const B2b()));
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),
        ),
        title: const Text(
          "Register Here",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  companyImage =
                      await _imagePicker.pickImage(source: ImageSource.gallery);
                  if (companyImage != null) {
                    log("File = ${companyImage!.path}");
                    setState(() {
                      uploadNdDownloadImage();
                    });
                  }
                },
                child: Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: const Color.fromARGB(255, 207, 227, 243),
                    child: (companyImage == null)
                        ? const Center(
                            child: Icon(
                              Icons.camera_alt,
                              size: 100,
                              color: Colors.blue,
                            ),
                          )
                        : ClipOval(
                            child: Image.file(
                              File(companyImage!.path),
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Organization Name: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),

              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 218, 229, 242)
                          .withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(5, 8),
                    )
                  ],
                ),
                child: TextField(
                  controller: organizationName,
                  decoration: InputDecoration(
                    //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                    //fillColor: const Color.fromARGB(255, 219, 229, 246),
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    //labelText: 'Enter your email',
                    hintText: 'Enter Organization Name...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),

                    prefixIcon: const Icon(Icons.business),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Owner Name: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 218, 229, 242)
                          .withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(5, 8),
                    )
                  ],
                ),
                child: TextField(
                  controller: ownerName,
                  decoration: InputDecoration(
                    //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                    //fillColor: const Color.fromARGB(255, 219, 229, 246),
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    //hintText: "Enter Owner Name...",
                    hintText: 'Enter Owner Name...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),

                    prefixIcon: const Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Domain Name: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 218, 229, 242)
                          .withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(5, 8),
                    )
                  ],
                ),
                child: TextField(
                  controller: domain,
                  decoration: InputDecoration(
                    //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                    //fillColor: const Color.fromARGB(255, 219, 229, 246),
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    //hintText: "Enter Domain...",
                    hintText: 'Enter Domain...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),

                    prefixIcon: const Icon(Icons.category),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Organization Type: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),

              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 218, 229, 242)
                          .withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(5, 8),
                    )
                  ],
                ),
                child: TextField(
                  controller: organizationType,
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    hintText: 'Enter Organization Type...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    suffixIcon: const Icon(Icons.domain_add),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Requirement for any business colab: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),

              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 218, 229, 242)
                          .withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(5, 8),
                    )
                  ],
                ),
                child: TextField(
                  controller: businessColab,
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    hintText:
                        "like packaging,manufacturing,entrtprising etc....",
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "GSTIN No: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 218, 229, 242)
                          .withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(5, 8),
                    )
                  ],
                ),
                child: TextField(
                  controller: gstinNo,
                  decoration: InputDecoration(
                    //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                    //fillColor: const Color.fromARGB(255, 219, 229, 246),
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    //hintText: "Enter GSTIN No. (Optional)",
                    hintText: 'Enter GSTIN No. (Optional)',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),

                    prefixIcon: const Icon(Icons.numbers),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Offered Money Per Person",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
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
                  controller: moneyOffered,
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    hintText: 'Enter Money Per Person....',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    prefixIcon: const Icon(Icons.attach_money_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Requirement For Employees: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
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
                  controller: employeerequire,
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    hintText: 'Enter Requirement....',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    prefixIcon: const Icon(Icons.person_3),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Address: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),

              Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 218, 229, 242)
                            .withOpacity(1),
                        spreadRadius: 0.5,
                        blurRadius: 5,
                        offset: const Offset(5, 8),
                      )
                    ]),
                child: TextField(
                  controller: address,
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    hintText: 'Enter Address...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    prefixIcon: const Icon(Icons.post_add),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Want to Colab with Other Business: ",
                  style: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
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
                  controller: colabwithBusiness,
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    hintText:
                        'like packaging,manufacturing,entrtprising etc....',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    prefixIcon: const Icon(Icons.business_center),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Colabaration Type:",
                  style: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),

              Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 218, 229, 242)
                            .withOpacity(1),
                        spreadRadius: 0.5,
                        blurRadius: 5,
                        offset: const Offset(5, 8),
                      )
                    ]),
                child: TextField(
                  controller: colabarationType,
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    hintText: 'Enter Type...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    prefixIcon: const Icon(Icons.post_add),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "City: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),

              Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 218, 229, 242)
                            .withOpacity(1),
                        spreadRadius: 0.5,
                        blurRadius: 5,
                        offset: const Offset(5, 8),
                      )
                    ]),
                child: TextField(
                  controller: city,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                    //fillColor: const Color.fromARGB(255, 219, 229, 246),
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    hintText: 'Enter City...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              GradientText(
                "State: ",
                style: const TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.bold),
                colors: const [
                  Color.fromARGB(255, 0, 45, 81),
                  Color.fromARGB(255, 0, 144, 247),
                ],
              ),
              //SizedBox(height: screenHeight * 0.03),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 218, 229, 242)
                          .withOpacity(1),
                      spreadRadius: 0.5,
                      blurRadius: 5,
                      offset: const Offset(5, 8),
                    )
                  ],
                ),
                child: TextField(
                  controller: state,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                    //fillColor: const Color.fromARGB(255, 219, 229, 246),
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    hintText: 'Enter State...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Submitbutton().submitButton(context: context, email: email)
            ],
          ),
        ),
      ),
    );
  }
}
