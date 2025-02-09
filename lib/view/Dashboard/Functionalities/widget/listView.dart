import 'package:business_dot_com/model/comp_detail_model.dart';
import 'package:business_dot_com/view/Dashboard/CompDetails/description.dart';
import 'package:flutter/material.dart';

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
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      height: screenHeight * 0.44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: majorCompDetailModelList[majorListIndex].length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTapDown: (_) {
              setState(
                () {
                  highlightedIndex = index;
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.01),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: screenHeight * 0.42, // Dynamic card height
                    width: screenWidth * 0.8,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: highlightedIndex == index
                                ? const Color.fromARGB(255, 200, 225, 245)
                                    .withOpacity(0.5)
                                : const Color.fromARGB(255, 180, 178, 178)
                                    .withOpacity(0.5),
                            //spreadRadius: 4,
                            blurRadius: 4,
                            offset: const Offset(4, 7),
                          ),
                        ],
                        border: Border.all(
                          width: 1.5,
                          color: highlightedIndex == index
                              ? const Color.fromARGB(255, 207, 228, 245)
                              : const Color.fromARGB(255, 33, 150, 243),
                        ),
                        color: highlightedIndex == index
                            ? const Color.fromARGB(255, 207, 228, 245)
                            : const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(10)),
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
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.01),
                            child: SizedBox(
                              height: screenHeight * 0.21,
                              width: screenWidth * 0.7,
                              child: Image.network(
                                majorCompDetailModelList[majorListIndex][index]
                                    .compLogo,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      //compShortDetailList[index].organizationName,
                                      majorCompDetailModelList[majorListIndex]
                                              [index]
                                          .organizationName!,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.location_on),
                                    Text(
                                      // compShortDetailList[index].city,
                                      majorCompDetailModelList[majorListIndex]
                                              [index]
                                          .city,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.035,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Text(
                                  //compShortDetailList[index].pitch,
                                  majorCompDetailModelList[majorListIndex]
                                          [index]
                                      .pitchTextEditingController,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Text(
                                  "Revenue:${majorCompDetailModelList[majorListIndex][index].revenue}",
                                  //{compShortDetailList[index].revenue}",

                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.001),
                                Text(
                                  "Looking for :${majorCompDetailModelList[majorListIndex][index].investmentRange == "" ? "Partner" : " investor"}",
                                  //{compShortDetailList[index].revenue}",

                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                )
                              ],
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
