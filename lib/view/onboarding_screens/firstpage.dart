import 'package:business_dot_com/view/onboarding_screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 250,
            child:
                Image.asset("assets/images/firstPage.jpeg", fit: BoxFit.cover),
          ),
          Column(
            children: [
              const SizedBox(
                height: 1,
              ),
              const Spacer(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    GradientText(
                      "Business.com",
                      style: const TextStyle(
                          fontSize: 35.0, fontWeight: FontWeight.bold),
                      colors: const [
                        Color.fromARGB(255, 0, 45, 81),
                        Color.fromARGB(255, 0, 144, 247),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 20,
                      child: const Text(
                        "Let's Dive Into The World Of Entreprenures",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Onboarding()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 17),
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
                            "Explore",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ])));
  }
}
