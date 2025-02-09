import 'dart:ui';

//import 'package:business_dot_com/view/Dashboard/dashboard.dart';
import 'package:business_dot_com/model/comp_detail_model.dart';
import 'package:flutter/material.dart';

import 'MorePageUI.dart';

class Description extends StatelessWidget {
  final int majorListIndex;

  final int index;

  const Description(
      {super.key, required this.majorListIndex, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: const Color.fromARGB(255, 3, 51, 91),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            iconTheme: const IconThemeData(
              color: Colors.white, // Set all AppBar icons to white
            ),
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // Check if the SliverAppBar is collapsed
                bool isCollapsed = constraints.maxHeight <= kToolbarHeight + 50;

                return FlexibleSpaceBar(
                  title: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: isCollapsed
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              key: const ValueKey("Collapsed"),
                              children: [
                                CircleAvatar(
                                  radius: 12, // Adjust the size as needed
                                  backgroundImage: NetworkImage(
                                    majorCompDetailModelList[majorListIndex]
                                            [index]
                                        .compLogo,
                                  ),
                                ),
                                const SizedBox(
                                    width: 10), // Space between image and text
                                Text(
                                  majorCompDetailModelList[majorListIndex]
                                          [index]
                                      .organizationName!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          )
                        : const SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              key: ValueKey("Expanded"),
                              mainAxisSize: MainAxisSize.min,
                              children: [],
                            ),
                          ),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        height: 200,
                        margin: const EdgeInsets.only(bottom: 40),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 0, 45, 81),
                              Color.fromARGB(255, 0, 144, 247),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          color: Colors.blue,
                        ),
                        child: Image.network(
                          majorCompDetailModelList[majorListIndex][index]
                              .compLogo,
                          fit: BoxFit.fill,
                        ),
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.blue.withOpacity(0.1),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 210.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 0, 45, 81),
                              Color.fromARGB(255, 0, 144, 247),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 0, 45, 81),
                                    Color.fromARGB(255, 0, 144, 247),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                //color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: Image.network(
                                    majorCompDetailModelList[majorListIndex]
                                            [index]
                                        .compLogo,
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Text(
                              majorCompDetailModelList[majorListIndex][index]
                                  .organizationName!,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            automaticallyImplyLeading: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                MorePageUI(majorListIndex: majorListIndex, index: index),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 3, 51, 91),
    );
  }
}
