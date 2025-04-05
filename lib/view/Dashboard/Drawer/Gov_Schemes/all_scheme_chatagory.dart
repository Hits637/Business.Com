import 'dart:developer';

import 'package:business_dot_com/view/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cboi.dart';
import 'digital_communication.dart';
import 'meity.dart';
import 'niti.dart';
import 'north_estan_region.dart';

class AllSchemeChatagory extends StatefulWidget {
  const AllSchemeChatagory({super.key});
  @override
  State<AllSchemeChatagory> createState() => _SchemesScreenCategoryState();
}

class _SchemesScreenCategoryState extends State<AllSchemeChatagory> {
  final List<Map<String, dynamic>> schemes = [
    {
      "title": "Ministry of Electronics and Information Technology (MeitY)",
      "imagePath": "assets/Gov_schemes_logo/MeIt.png",
      "onTap": (BuildContext context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Meity()));
      }
    },
    {
      "title": "Ministry of Communications",
      "imagePath": "assets/Gov_schemes_logo/ministry of communication.jpeg",
      "onTap": (BuildContext context) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DigitalCommunication()));
      }
    },
    {
      "title": "Ministry of Development of North Eastern Region",
      "imagePath": "assets/Gov_schemes_logo/NEC.jpeg",
      "onTap": (BuildContext context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EasternRegion()));
      }
    },
    {
      "title": "Niti Aayog",
      "imagePath": "assets/Gov_schemes_logo/Niti.jpeg",
      "onTap": (BuildContext context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NitiAayog()));
      }
    },
    {
      "title": "Central Bank of India",
      "imagePath": "assets/Gov_schemes_logo/CBOI.png",
      "onTap": (BuildContext context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CBOI()));
      }
    },
    {
      "title": "Ministry of Science & Technology",
      "imagePath": "assets/Gov_schemes_logo/science.png",
      "onTap": () => log("Ministry of Science & Technology tapped"),
    },
    {
      "title": "Ministry of Housing and Urban Affairs Schemes",
      "imagePath": "assets/Gov_schemes_logo/housing2.jpg",
      "onTap": () => log("Housing and Urban Affairs tapped"),
    },
    {
      "title": "Ministry of Micro, Small and Medium Enterprises",
      "imagePath": "assets/Gov_schemes_logo/MSME.jpg",
      "onTap": () => log("MSME tapped"),
    },
    {
      "title": "Ministry of Commerce and Industry Schemes",
      "imagePath": "assets/Gov_schemes_logo/commerce.jpeg",
      "onTap": () => log("Commerce and Industry tapped"),
    },
    {
      "title": "Ministry of Defence",
      "imagePath": "assets/Gov_schemes_logo/defence.jpeg",
      "onTap": () => log("Defence tapped"),
    },
    {
      "title": "Public Sector Enterprise",
      "imagePath": "assets/Gov_schemes_logo/public.jpeg",
      "onTap": () => log("Public Sector Enterprise tapped"),
    },
    {
      "title": "Ministry of Food Processing Industries",
      "imagePath": "assets/Gov_schemes_logo/food.jpg",
      "onTap": () => log("Food Processing tapped"),
    },
    {
      "title": "Ministry of Heavy Industries & Public Enterprises",
      "imagePath": "assets/Gov_schemes_logo/industries.jpg",
      "onTap": () => log("Heavy Industries tapped"),
    },
    {
      "title": "Ministry of Textiles",
      "imagePath": "assets/Gov_schemes_logo/textiles.jpeg",
      "onTap": () => log("Textiles tapped"),
    },
    {
      "title": "Ministry of Ayush",
      "imagePath": "assets/Gov_schemes_logo/Ayush.jpg",
      "onTap": () => log("Ayush tapped"),
    },
    {
      "title": "Ministry of Agriculture",
      "imagePath": "assets/Gov_schemes_logo/agri.png",
      "onTap": () => log("Agriculture tapped"),
    },
    {
      "title": "Ministry of Finance",
      "imagePath": "assets/Gov_schemes_logo/agri.png",
      "onTap": () => log("Agriculture tapped"),
    },
    {
      "title": "Ministry of New and Renewable Energy Sources Schemes",
      "imagePath": "assets/Gov_schemes_logo/agri.png",
      "onTap": () => log("Agriculture tapped"),
    },
    {
      "title": "Ministry of Social Justice and Empowerment (MoSJE)",
      "imagePath": "assets/Gov_schemes_logo/agri.png",
      "onTap": () => log("Agriculture tapped"),
    },
    {
      "title": "Biotechnology Industry Research Assistance Council (BIRAC)",
      "imagePath": "assets/Gov_schemes_logo/agri.png",
      "onTap": () => log("Agriculture tapped"),
    },
    {
      "title": "National Bank for Agriculture and Rural Development (NABARD)",
      "imagePath": "assets/Gov_schemes_logo/agri.png",
      "onTap": () => log("Agriculture tapped"),
    },
    {
      "title": "Ministry of Tribal Affairs (MoTA)",
      "imagePath": "assets/Gov_schemes_logo/agri.png",
      "onTap": () => log("Agriculture tapped"),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            // LinearGradient
            gradient: LinearGradient(
              // colors for gradient
              colors: [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),
        ),
        title: Text(
          "Government Schemes",
          style: TextStyle(
              color: Colors.white, fontSize: 26.w, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1, // Adjust for layout proportions
          ),
          itemCount: schemes.length,
          itemBuilder: (context, index) {
            final scheme = schemes[index];
            return GestureDetector(
              onTap: () => scheme['onTap'](context), // Pass context here
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(3, 4),
                        color: Colors.grey,
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        scheme['imagePath'],
                        width: 60.w,
                        height: 60.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        scheme['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.w,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
