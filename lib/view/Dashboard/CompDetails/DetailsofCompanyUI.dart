import "package:business_dot_com/Controller/data_controller.dart";
import "package:business_dot_com/view/Dashboard/CompDetails/widget/connect_code.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:simple_gradient_text/simple_gradient_text.dart";

import "../../../model/comp_detail_model.dart";

class DetailsOfCompanyUI extends StatelessWidget {
  final int majorListIndex;
  final int index;
  const DetailsOfCompanyUI(
      {super.key, required this.majorListIndex, required this.index});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 8, bottom: 2),
            child: GradientText(
              "Owner Name: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),
          //SizedBox(height: screenHeight * 0.015),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Text(
                    majorCompDetailModelList[majorListIndex][index].ownerName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                //Text("Core2Web"),
              ],
            ),
          ),
          //const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 2),
            child: GradientText(
              "Domain: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),
          //const SizedBox(height: 12),
          Container(
            //height: 50,
            width: screenWidth,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            //color: const Color.fromARGB(255, 233, 243, 251),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    majorCompDetailModelList[majorListIndex][index].domain,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 2),
            child: GradientText(
              "Establishment Year: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),
          //SizedBox(height: screenHeight * 0.015),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    majorCompDetailModelList[majorListIndex][index]
                        .establishmentYear,
                    style: GoogleFonts.abhayaLibre(
                      textStyle: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 2),
            child: GradientText(
              "Organization Type: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),
          //SizedBox(height: screenHeight * 0.015),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    majorCompDetailModelList[majorListIndex][index]
                        .organizationType,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //SizedBox(height: screenHeight * 0.02),
          // GradientText(
          //   "GSTIN No.: ",
          //   style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
          //   colors: const [
          //     Color.fromARGB(255, 0, 45, 81),
          //     Color.fromARGB(255, 0, 144, 247),
          //   ],
          // ),
          // SizedBox(
          //   height: screenWidth * 0.015,
          // ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   decoration: const BoxDecoration(
          //     color: Color.fromARGB(255, 233, 243, 251),
          //     borderRadius: BorderRadius.all(Radius.circular(20)),
          //   ),
          //   child: Padding(
          //     padding: EdgeInsets.all(screenHeight * 0.03),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           majorCompDetailModelList[majorListIndex][index].gstinNo == "" ?"",
          //           style: const TextStyle(
          //             fontSize: 15,
          //             fontWeight: FontWeight.w400,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 2),
            child: GradientText(
              "Pitch: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),
          // SizedBox(
          //   height: screenWidth * 0.015,
          // ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.03,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    majorCompDetailModelList[majorListIndex][index]
                        .pitchTextEditingController,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: screenWidth * 0.02,
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 2),
            child: GradientText(
              "Description: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),
          // SizedBox(
          //   height: screenWidth * 0.015,
          // ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.03,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    majorCompDetailModelList[majorListIndex][index]
                        .descriptionTextEditingController,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 2),
            child: GradientText(
              "Website: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.03,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    majorCompDetailModelList[majorListIndex][index]
                                .websiteTextEditingController ==
                            ""
                        ? "N/A"
                        : majorCompDetailModelList[majorListIndex][index]
                            .websiteTextEditingController,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: screenWidth * 0.015,
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 2),
            child: GradientText(
              "Revenue: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(screenHeight * 0.015),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    majorCompDetailModelList[majorListIndex][index].revenue,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 2),
            child: GradientText(
              "Address: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    majorCompDetailModelList[majorListIndex][index].address,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 2),
            child: GradientText(
              "City: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),
          Container(
            //height: 50,
            width: screenWidth,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    majorCompDetailModelList[majorListIndex][index].city,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 2),
            child: GradientText(
              "State: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),
          Container(
            //height: 50,
            width: screenWidth,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    majorCompDetailModelList[majorListIndex][index].state,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 2),
            child: GradientText(
              "Requirement: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.03,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    majorCompDetailModelList[majorListIndex][index]
                        .partnerRequirment,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 2),
            child: GradientText(
              "Min Qualification: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.03,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    majorCompDetailModelList[majorListIndex][index]
                        .partnerMinQualification,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 2),
            child: GradientText(
              "Skills: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.03,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    majorCompDetailModelList[majorListIndex][index]
                        .partnerSkills,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 2),
            child: GradientText(
              "Stakes: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.03,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    majorCompDetailModelList[majorListIndex][index]
                        .partnerStakes,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 2),
            child: GradientText(
              "Investment Range: ",
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 243, 251),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.03,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    majorCompDetailModelList[majorListIndex][index]
                                .investmentRange ==
                            ""
                        ? 'No need of Investment'
                        : majorCompDetailModelList[majorListIndex][index]
                            .investmentRange!,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 18, left: 8, bottom: 5),
            child: Center(
              child: Text(
                "Are you interrested in stakes offered..!!",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          Center(
            child: GestureDetector(
              onTap: () async {
                openWhatsApp(majorListIndex: majorListIndex, index: index);
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 10,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    // colors for gradient
                    colors: [
                      Color.fromARGB(255, 0, 45, 81),
                      Color.fromARGB(255, 0, 144, 247),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 145, 190, 243)
                          .withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(5, 8),
                    )
                  ],

                  borderRadius: BorderRadius.circular(20),
                  //color: const Color.fromRGBO(32, 103, 234, 1),
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text(
                    "Connect",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
