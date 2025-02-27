import 'package:business_dot_com/model/comp_detail_model.dart';
import 'package:business_dot_com/view/Dashboard/CompDetails/description.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget extends StatefulWidget {
  final String? email;
  final int majorListIndex;
  const MyWidget(
      {super.key, required this.email, required this.majorListIndex});

  @override
  State<MyWidget> createState() =>
      _MyWidgetState(email: email, majorListIndex: majorListIndex);
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void dispose() {
    highlightedIndex = -1;
    super.dispose(); // Always call super.dispose() at the end.
  }

  String? email;
  final int majorListIndex;
  _MyWidgetState({required this.email, required this.majorListIndex});
  int? highlightedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 220.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: majorCompDetailModelList[majorListIndex].length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 215.h, // Dynamic card height
                    width: 230.w,

                    child: GestureDetector(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Description(
                              majorListIndex: widget.majorListIndex,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              height: 190.h,
                              width: 226.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    const BoxShadow(
                                        blurRadius: 4,
                                        offset: Offset(2, 3),
                                        color: Colors.grey),
                                  ],
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(top: 70.r, left: 20.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      //compShortDetailList[index].organizationName,
                                      majorCompDetailModelList[majorListIndex]
                                              [index]
                                          .organizationName!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      //compShortDetailList[index].pitch,
                                      majorCompDetailModelList[majorListIndex]
                                              [index]
                                          .pitchTextEditingController,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Revenue:${majorCompDetailModelList[majorListIndex][index].revenue}",
                                      //{compShortDetailList[index].revenue}",

                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Looking for :${majorCompDetailModelList[majorListIndex][index].investmentRange == "" ? "Partner" : " investor"}",
                                      //{compShortDetailList[index].revenue}",

                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          size: 12,
                                        ),
                                        Text(
                                          // compShortDetailList[index].city,
                                          majorCompDetailModelList[
                                                  majorListIndex][index]
                                              .city,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 70.w),
                            child: ClipOval(
                              child: Image.network(
                                  majorCompDetailModelList[majorListIndex]
                                          [index]
                                      .compLogo,
                                  height: 90.h,
                                  width: 90.h,
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
