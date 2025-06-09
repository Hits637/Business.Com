// custom_bottom_sheet.dart
import 'package:business_dot_com/view/Dashboard/Business_Registration/widget/partner_finish_button.dart';
//import 'package:business_dot_com/view/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../Components/text_editing_controller.dart';

void bottomSheetpartner(BuildContext context, {required String? email}) {
  //final double screenHeight = MediaQuery.of(context).size.height;
  final double screenWidth = MediaQuery.of(context).size.width;

  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.white,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isDismissible: false,
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientText(
                    "Requirement:  ",
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
                    controller: partnerRequirment,
                    decoration: InputDecoration(
                      //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                      //fillColor: const Color.fromARGB(255, 219, 229, 246),
                      fillColor: const Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                      //hintText: "What are you searchin in your Partner...",
                      hintText: "What are you searchin in your Partner...",
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
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientText(
                    "Min Qualification:  ",
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
                    controller: partnerMinQualification,
                    decoration: InputDecoration(
                      //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                      // fillColor: const Color.fromARGB(255, 219, 229, 246),
                      fillColor: const Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                      hintText: "Minimum Qualification Required...",
                      hintStyle: const TextStyle(
                        //color: Color.fromARGB(255, 190, 189, 189),
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
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientText(
                    "Skills:  ",
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
                    controller: partnerSkills,
                    decoration: InputDecoration(
                      //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                      //fillColor: const Color.fromARGB(255, 219, 229, 246),
                      fillColor: const Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                      hintText: "Minimun Skills Required...",
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
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientText(
                    "Stakes:  ",
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
                    controller: partnerStakes,
                    decoration: InputDecoration(
                      //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                      //fillColor: const Color.fromARGB(255, 219, 229, 246),
                      fillColor: const Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                      hintText: "Minimun Stakes to offer in Company...",
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
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PartnerFinishButton().finishButton(context, email: email)
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
