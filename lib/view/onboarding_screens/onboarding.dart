import 'package:business_dot_com/view/login_info/log_in.dart';
import 'package:business_dot_com/view/onboarding_screens/screen1.dart';
import 'package:business_dot_com/view/onboarding_screens/screen2.dart';
import 'package:business_dot_com/view/onboarding_screens/screen3.dart';
import 'package:business_dot_com/view/onboarding_screens/screen4.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            children: const [
              Screen1(),
              Screen2(),
              Screen3(),
              Screen4(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.91),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: const Text("Previous")),
                SmoothPageIndicator(
                    controller: _pageController,
                    count: 4,
                    effect: const SlideEffect()),
                onLastPage
                    ? GestureDetector(
                        onTap: () async {
                          // QuerySnapshot response = await FirebaseFirestore
                          //     .instance
                          //     .collection("CompanyDetails")
                          //     .get();

                          // for (int i = 0; i < response.docs.length; i++) {

                          //   if (response.docs.iterator.Domain ==)
                          //   log("${response.docs[i]['CompanyDetails']}");
                          //   compShortDetailList.add(CompShortDetail(
                          //       organizationName: "OrganizationName",
                          //       city: "city",
                          //       pitch: "pitch",
                          //       revenue: "Revenue"));
                          // }

                          //Ensure the context is valid for navigation
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()));
                        },
                        child: const Text("Finish"))
                    : GestureDetector(
                        onTap: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: const Text("Next")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
