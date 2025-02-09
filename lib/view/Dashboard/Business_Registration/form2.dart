import 'dart:developer';
import 'dart:io';

import 'package:business_dot_com/view/Dashboard/Business_Registration/Investor.dart';
import 'package:business_dot_com/view/Dashboard/Business_Registration/form1.dart';
import 'package:business_dot_com/view/Dashboard/Business_Registration/partner.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../widget/custom_snackbar.dart';
import '../../../Controller/text_editing_controller.dart';

class Form2 extends StatefulWidget {
  final String? email;
  const Form2({super.key, required this.email});

  @override
  State<Form2> createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  String? email;
  _Form2State({this.email});
  XFile? _pitchIdeaImage;
  final ImagePicker _imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegistrationForm()));
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            // LinearGradient
            gradient: LinearGradient(
              // colors for gradient
              colors: [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),
        ),
        title: const Text(
          "Register your firm",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GradientText(
                        "Pitch:  ",
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
                        controller: pitchTextEditingController,
                        decoration: InputDecoration(
                          //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                          //fillColor: const Color.fromARGB(255, 219, 229, 246),
                          fillColor: const Color.fromRGBO(255, 255, 255, 1),
                          filled: true,

                          hintText: "Pitch Your Idea...",
                          hintStyle: const TextStyle(
                            fontSize: 15,
                          ),
                          prefixIcon: const Icon(Icons.lightbulb),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 1.5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GradientText(
                        "Description:  ",
                        style: const TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                        colors: const [
                          Color.fromARGB(255, 0, 45, 81),
                          Color.fromARGB(255, 0, 144, 247),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        borderRadius: BorderRadius.circular(40),
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
                        controller: descriptionTextEditingController,
                        maxLines: 8,
                        decoration: InputDecoration(
                          //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                          //fillColor: const Color.fromARGB(255, 219, 229, 246),
                          fillColor: const Color.fromRGBO(255, 255, 255, 1),
                          filled: true,
                          //labelText: 'Enter your email',
                          hintText: "Enter Description...",
                          hintStyle: const TextStyle(
                            fontSize: 15,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 1.5),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GradientText(
                        "Product Image(If any):  ",
                        style: const TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                        colors: const [
                          Color.fromARGB(255, 0, 45, 81),
                          Color.fromARGB(255, 0, 144, 247),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            _pitchIdeaImage = await _imagePicker.pickImage(
                                source: ImageSource.gallery);
                            if (_pitchIdeaImage != null) {
                              log("File = ${_pitchIdeaImage!.path}");
                              setState(() {});
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 218, 229, 242)
                                          .withOpacity(1),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(5, 8),
                                )
                              ],
                            ),
                            child: (_pitchIdeaImage == null)
                                ? Image.asset(
                                    "assets/registration_form/fileru.png")
                                : Image.file(
                                    File(_pitchIdeaImage!.path),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GradientText(
                        "Website (If any):  ",
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
                          ]),
                      child: TextField(
                        controller: websiteTextEditingController,
                        decoration: InputDecoration(
                          //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                          //fillColor: const Color.fromARGB(255, 219, 229, 246),
                          fillColor: const Color.fromRGBO(255, 255, 255, 1),
                          filled: true,
                          //hintText: "Enter Website URL...",
                          hintText: "Enter Website URL...",
                          hintStyle: const TextStyle(
                            fontSize: 15,
                          ),
                          prefixIcon: const Icon(Icons.business),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 1.5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GradientText(
                        "What are you looking for? ",
                        style: const TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                        colors: const [
                          Color.fromARGB(255, 0, 45, 81),
                          Color.fromARGB(255, 0, 144, 247),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (pitchTextEditingController.text
                                    .trim()
                                    .isNotEmpty &&
                                descriptionTextEditingController.text
                                    .trim()
                                    .isNotEmpty) {
                              bottomSheetpartner(context, email: email);
                            } else {
                              CustomSnackBar.showCustomSnackbar(
                                  message: "Please enter valid Data",
                                  context: context);
                            }
                          },
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/partners.jpg"),
                                  fit: BoxFit.cover),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 218, 229, 242)
                                          .withOpacity(1),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(5, 8),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GradientText(
                                  "Partner  ",
                                  style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                  colors: const [
                                    Color.fromARGB(255, 0, 8, 15),
                                    Color.fromARGB(255, 2, 86, 146),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (pitchTextEditingController.text
                                    .trim()
                                    .isNotEmpty &&
                                descriptionTextEditingController.text
                                    .trim()
                                    .isNotEmpty) {
                              bottomSheet(context, email: email);
                            } else {
                              CustomSnackBar.showCustomSnackbar(
                                  message: "Please enter valid Data",
                                  context: context);
                            }
                          },
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/investor.png"),
                                  fit: BoxFit.cover),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 218, 229, 242)
                                          .withOpacity(1),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(5, 8),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GradientText(
                                  "Invester",
                                  style: const TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                  colors: const [
                                    Color.fromARGB(255, 0, 8, 15),
                                    Color.fromARGB(255, 2, 86, 146),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
