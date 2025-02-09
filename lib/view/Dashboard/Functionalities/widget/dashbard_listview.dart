import 'dart:developer';

import 'package:business_dot_com/view/Dashboard/Business_Registration/form1.dart';
import 'package:business_dot_com/view/Dashboard/Drawer/drawer.dart';
import 'package:business_dot_com/view/Dashboard/Functionalities/widget/listView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  final TextEditingController _searchController = TextEditingController();

  List<String> filteredItems = [];
  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items);
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

  _HomePageControllerState({required this.email});
  @override
  Widget build(BuildContext context) {
    String? email;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerPage(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            expandedHeight: 80.0, // Adjusted height
            floating: true,
            pinned: true,
            flexibleSpace: ClipPath(
              //clipper: CustomAppBarClipper(), // Curved bottom
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    // colors for gradient
                    colors: [
                      Color.fromARGB(255, 0, 45, 81),
                      Color.fromARGB(255, 0, 144, 247),
                    ],
                  ),
                ),
                child: const SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Business.com",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        //textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          //  SliverToBoxAdapter(
          //   child:SizedBox(height:20),
          // ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 360,
                height: 50,
                decoration: BoxDecoration(
                  // Gradient applied to the border
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 0, 45, 81),
                      Color.fromARGB(255, 0, 144, 247),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                //padding: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged, // Trigger search logic
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.blue),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                      hintText: 'Search...',
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 8),
                      child: GradientText(
                        domainList[index],
                        colors: const [
                          Color.fromARGB(255, 0, 45, 81),
                          Color.fromARGB(255, 0, 144, 247),
                        ],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    MyWidget(
                      email: email, // Replace with dynamic data
                      majorListIndex: index, // Pass index or other dynamic data
                    ),
                  ],
                );
              },
              childCount: domainList.length,
            ),
          ),
        ],
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



//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 2, left: 8),
//               child: GradientText(
//                 "Hospitality and Tourism",
//                 colors: const [
//                   Color.fromARGB(255, 0, 45, 81),
//                   Color.fromARGB(255, 0, 144, 247),
//                 ],
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: MyWidget(
//               email: email,
//               majorListIndex: 1,
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 2, left: 8),
//               child: GradientText(
//                 "Food and Beverages",
//                 colors: const [
//                   Color.fromARGB(255, 0, 45, 81),
//                   Color.fromARGB(255, 0, 144, 247),
//                 ],
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: MyWidget(
//               email: email,
//               majorListIndex: 2,
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 2, left: 8),
//               child: GradientText(
//                 "Helthcare and Pharmaceuticals",
//                 colors: const [
//                   Color.fromARGB(255, 0, 45, 81),
//                   Color.fromARGB(255, 0, 144, 247),
//                 ],
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: MyWidget(
//               email: email,
//               majorListIndex: 3,
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           log("$email");
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) {
//                 return RegistrationForm(email: email);
//               },
//             ),
//           );
//         },
//         backgroundColor: Colors.white,
//         child: const Icon(
//           Icons.add,
//           size: 45,
//           color: Colors.blue,
//         ),
//       ),
//     );
//   }
// }
