import 'package:business_dot_com/view/Dashboard/Business_Registration/widget/ProfileInfo.dart';
import 'package:business_dot_com/view/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    //final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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

        toolbarHeight: 200,
        automaticallyImplyLeading: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Align(
                  alignment:
                      Alignment.topLeft, // Position the icon button as needed
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white, // Set the color of the icon
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/team.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.06,
                  ),
                  const Column(
                    children: [
                      const Text(
                        "Core2Web",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Shashi Bagal (MCA)",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        //centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            height: screenWidth * 0.2,
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
            child: Container(
              height: screenWidth * 0.2,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 2,
                    offset: const Offset(0, -3),
                  ),
                ],
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                infoCard(context, "Email ID", "harshal@gmail.com"),
                infoCard(context, "Contact Number", "8953454735"),
                infoCard(context, "GSTIN No", "1234"),
                infoCard(context, "Revenue", "1.2cr"),
                infoCard(context, "Company Type", "LLc"),
                infoCard(context, "Domain", "IT And Software"),
                infoCard(context, "Establishment Year", "2019"),
                infoCard(context, "Looking For", "Partener"),
                infoCard(context, "Offered Stakes", "150000"),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
