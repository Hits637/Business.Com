import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 393.w,
                        child: Image.asset(
                            "assets/drawer/help_support/help_vector.png",
                            fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60.h),
                        child: SizedBox(
                          width: 393.w,
                          child: Image.asset(
                              "assets/drawer/help_support/collabration_img_help.png"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 65.h, left: 10.w),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                Text(
                                  "back",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 60.h),
                          child: Text(
                            "Help & Support",
                            style: GoogleFonts.roboto(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // FAQs Section
            Center(
              child: Text(
                "Frequently Asked Questions",
                style: GoogleFonts.roboto(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(36, 89, 171, 1)),
              ),
            ),
            SizedBox(height: 20.h),
            const FAQItem(
              question: "How do I use the Partner Connect feature?",
              answer:
                  "Navigate to the Partner Connect section from the main menu, and explore partnerships that align with your business goals.",
            ),
            const FAQItem(
              question: "How can I find investors?",
              answer:
                  "Use the Investor Search functionality to view potential investors interested in your business sector.",
            ),
            const FAQItem(
              question: "Where can I access government schemes?",
              answer:
                  "Visit the Government Schemes section in the app for the latest programs tailored for businesses like yours.",
            ),
            SizedBox(height: 20.h),

            // Contact Support Section
            Center(
              child: Text(
                "Contact Support",
                style: GoogleFonts.roboto(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(36, 89, 171, 1)),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Text(
                "Need further assistance? Our support team is here to help:",
                style: GoogleFonts.inter(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 8.0.h),
            ListTile(
              leading: Icon(Icons.email, color: Color.fromRGBO(36, 89, 171, 1)),
              title: Text(
                "Email: Ruchikapatil66@gmail.com",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400, fontSize: 14.0),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Color.fromRGBO(36, 89, 171, 1)),
              title: Text("Phone: +918999224867",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400, fontSize: 14.0)),
            ),

            const SizedBox(height: 24.0),

            // Guides and Resources Section
            Center(
              child: Text(
                "Guides & Resources",
                style: GoogleFonts.roboto(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(36, 89, 171, 1)),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Text(
                "Explore our detailed guides to get the most out of the app:",
                style: GoogleFonts.inter(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ListTile(
              leading:
                  Icon(Icons.book, color: Color.fromARGB(255, 0, 144, 247)),
              title: Text("Getting Started with business.com",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400, fontSize: 14.0)),
            ),
            ListTile(
              leading:
                  Icon(Icons.search, color: Color.fromARGB(255, 0, 45, 81)),
              title: Text("How to Find the Right Investor",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400, fontSize: 14.0)),
            ),
            ListTile(
              leading:
                  Icon(Icons.link, color: Color.fromARGB(255, 0, 144, 247)),
              title: Text("Connecting with Government Schemes",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400, fontSize: 14.0)),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Widget for FAQ Items
class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({required this.question, required this.answer, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 14.r),
            child: Text(
              question,
              style: GoogleFonts.inter(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 4.0.h),
          Padding(
            padding: EdgeInsets.only(left: 24.r),
            child: Text(
              answer,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400, fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}
