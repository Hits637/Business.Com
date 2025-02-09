import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen1State();
}

class _Screen1State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    "assets/svg/Shape 3.svg",
                    fit: BoxFit.fitHeight,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 7),
                          Text(
                            "Business.com",
                            style: GoogleFonts.mukta(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Container(
                            height: 1,
                            width: 200,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Professional App for your business",
                              textAlign: TextAlign.end,
                              style: GoogleFonts.mukta(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
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
                height: 210,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 450,
                  child: SvgPicture.asset(
                    "assets/svg/screen3.svg",
                    fit: BoxFit.cover,
                  )),
              GradientText(
                "Know about Government Schemes !!",
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
                  "Unlock opportunities with government-backed support.Empowering growth through accessible schemes.",
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
