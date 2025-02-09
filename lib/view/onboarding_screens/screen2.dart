import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen1State();
}

class _Screen1State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    child: SvgPicture.asset(
                      "assets/svg/secondscreen.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 6),
                          GradientText(
                            "Business.com",
                            style: TextStyle(
                                fontSize: 28.0, fontWeight: FontWeight.bold),
                            colors: [
                              Color.fromARGB(255, 0, 45, 81),
                              Color.fromARGB(255, 0, 144, 247),
                            ],
                          ),
                          Container(
                            height: 1,
                            width: 200,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Professional App for your business",
                              style: GoogleFonts.mukta(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
          Column(
            children: [
              const SizedBox(
                height: 190,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: SvgPicture.asset(
                    "assets/svg/screen2.svg",
                    fit: BoxFit.cover,
                  )),
              GradientText(
                "Look For Investors !!",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                colors: const [
                  Color.fromARGB(255, 0, 45, 81),
                  Color.fromARGB(255, 0, 144, 247),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Text(
                  "Fuel your vision with the right investments.Connecting innovators with visionary investors",
                  style: GoogleFonts.mukta(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ]),
      ],
    );
  }
}
