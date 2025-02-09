import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const NewGetStrated());
}

class NewGetStrated extends StatefulWidget {
  const NewGetStrated({super.key});

  @override
  State<NewGetStrated> createState() => _NewGetStratedState();
}

class _NewGetStratedState extends State<NewGetStrated> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Business",
                style: GoogleFonts.rampartOne(
                    //color: Colors.white70,
                    //fontFamily: 'Bulletto',
                    color: Colors.white,
                    letterSpacing: 1.17,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    ".com",
                    style: GoogleFonts.rampartOne(
                        color: Colors.white,
                        //fontFamily: 'Bulletto',
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
