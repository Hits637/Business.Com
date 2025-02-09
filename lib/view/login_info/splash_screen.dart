import 'package:business_dot_com/view/onboarding_screens/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/Handshake Deal.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Centered Content
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Business",
                      style: GoogleFonts.rampartOne(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 15),
                        Text(
                          ".com",
                          style: GoogleFonts.rampartOne(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void navigate(BuildContext context) {
  Future.delayed(
    const Duration(seconds: 5),
    () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const Firstpage();
          },
        ),
      );
    },
  );
}
