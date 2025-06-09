import 'dart:developer';

import 'package:business_dot_com/Controller/data_controller.dart';
import 'package:business_dot_com/view/Dashboard/Business_Registration/form1.dart';
import 'package:business_dot_com/view/Dashboard/Drawer/drawer.dart';
import 'package:business_dot_com/view/Dashboard/Functionalities/widget/listView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../model/comp_detail_model.dart';

class HomePageController extends StatefulWidget {
  final String? email;

  const HomePageController({super.key, required this.email});

  @override
  State<HomePageController> createState() =>
      _HomePageControllerState(email: email);
}

class _HomePageControllerState extends State<HomePageController> {
  String? email;
  late String userName;
  bool isSearchClicked = true;
  String searchText = '';
  List<String> items = [
    'Information Technology (IT) and Software',
    'Telecommunications',
    'Automobile',
    'Banking and Financial Services',
    'Healthcare and Pharmaceuticals',
    'Retail and E-commerce',
    'Energy and Power',
    'Consumer Goods and FMCG',
    'Real Estate and Infrastructure',
    'Education and EdTech',
    'Hospitality and Tourism',
    'Media and Entertainment',
    'Agriculture and Agri-Tech',
    'Manufacturing and Industrial Goods',
    'Logistics and Supply Chain',
    'Aerospace and Defence',
    'Chemicals and Petrochemicals',
    'Financial Technology (FinTech)',
    'Legal and Consulting Services',
    'Environmental and Waste Management',
    'Textiles and Apparel',
    'Food and Beverage (F&B)',
    'Technology and Electronics',
    'Space and Satellite',
    'Retail Banking and Microfinance',
    'Sports and Fitness',
    'Luxury and Lifestyle',
    'Pharmaceutical and Biotech Research',
    'Construction and Engineering',
    'Waste to Energy',
    'Artificial Intelligence (AI) and Robotics',
    'Cybersecurity',
    'Digital Marketing and Advertising',
    'Human Resources and Recruitment',
    'Arts',
    'Culture, and Creative Industries',
    'Environmental Sustainability',
    'Insurance',
    'Supply Chain and Procurement Services',
    'Pet Care and Veterinary Services',
    'Waste Recycling and Circular Economy',
    'Financial Auditing and Accounting Services',
    'Event Management and Conferences',
    'Cloud Computing and Hosting Services',
    'Transportation and Shipping',
    'Water Purification and Management',
    'Construction Materials and Cement',
    'Tourism and Travel Services',
    'Gaming and eSports',
    'Retail Consumer Electronics',
    'Packaging',
    'Biotechnology and Life Sciences',
    'Petroleum and Natural Gas',
    'Mining and Metals',
    'Civil Aviation',
    'Marine and Shipping',
    'Luxury Real Estate and Property Development',
    'Public Sector Enterprises (PSUs)',
    'Social Impact and Non-Profit',
    'Cryptocurrency and Blockchain',
    'Agricultural Equipment and Technology',
    'Smart Home and IoT (Internet of Things)',
    'Social Media and Online Content Creation',
    'Electric Vehicles (EVs) and Clean Energy',
    '3D Printing and Additive Manufacturing',
    'Security Services and Systems',
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items);
     userName = email!.split('@')[0].replaceAll(RegExp(r'[0-9]'), '');
  }

  void _onSearchChanged(String value) {
    setState(() {
      searchText = value;
      myFilterItems();
    });
  }

  void myFilterItems() {
    if (searchText.isEmpty) {
      filteredItems = List.from(items);
    } else {
      filteredItems = items
          .where(
              (item) => item.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }

  Future<void> _refresh() async {
    await DataController.fetchCompData();
    setState(() {});
  }

  _HomePageControllerState({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            const Spacer(),
            const Text(
              "Business.com",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 1.r),
              child: const Icon(
                Icons.search,
                size: 26,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      drawer: const DrawerPage(),
      body: RefreshIndicator(
        onRefresh: _refresh,
        //backgroundColor: Colors.blue,
        //color: Colors.white,

        child: Stack(children: [
          Image.asset(
            "assets/images/main_dashboard_vector.png",
            height: 393.w,
            width: 393.w,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 90.h),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            "assets/images/dashboard_3Dimg.png",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello, $userName",
                                  style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Let's Explore",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    domainList.length,
                    (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15),
                          child: Text(
                            domainList[index],
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        MyWidget(
                          email: email,
                          majorListIndex: index,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log("$email");
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return RegistrationForm(email: email);
              },
            ),
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          size: 45,
          color: Colors.blue,
        ),
      ),
    );
  }
}
