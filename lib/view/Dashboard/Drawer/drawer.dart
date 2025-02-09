import 'package:business_dot_com/view/Dashboard/Drawer/About_Us/about_us.dart';
import 'package:business_dot_com/view/Dashboard/Drawer/Gov_Schemes/all_scheme_chatagory.dart';
import 'package:business_dot_com/view/Dashboard/Drawer/Help&Support/help_and_support.dart';
import 'package:business_dot_com/view/Dashboard/Drawer/News/news_screen.dart';
import 'package:business_dot_com/view/login_info/log_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 8,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  // colors for gradient
                  colors: [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
                color: Color.fromRGBO(32, 103, 234, 1),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 0, 45, 81),
                            Color.fromARGB(255, 0, 144, 247),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: const Icon(
                        Icons.home,
                        color: Colors
                            .white, // Base color (acts as a mask for the gradient)
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'HOME',
                    style: GoogleFonts.abhayaLibre(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 0, 45, 81),
                      Color.fromARGB(255, 0, 144, 247),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: const Icon(
                  Icons.account_balance,
                  color: Colors.white, // Base color to act as the mask
                  size: 30,
                ),
              ),
            ),
            title: Text(
              'Government Scheme',
              style: GoogleFonts.abhayaLibre(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AllSchemeChatagory()));
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 0, 45, 81),
                      Color.fromARGB(255, 0, 144, 247),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: const Icon(
                  Icons.newspaper,
                  color: Colors.white, // Base color to act as the mask
                  size: 30,
                ),
              ),
            ),
            title: Text(
              'News Section',
              style: GoogleFonts.abhayaLibre(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => NewsScreen()));
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 0, 45, 81),
                      Color.fromARGB(255, 0, 144, 247),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: const Icon(
                  Icons.help,
                  color: Colors.white, // Base color to act as the mask
                  size: 30,
                ),
              ),
            ),
            title: Text(
              'Help',
              style: GoogleFonts.abhayaLibre(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HelpPage(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 0, 45, 81),
                      Color.fromARGB(255, 0, 144, 247),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: const Icon(
                  Icons.info,
                  color: Colors.white, // Base color to act as the mask
                  size: 30,
                ),
              ),
            ),
            title: Text(
              'About Us',
              style: GoogleFonts.abhayaLibre(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AboutUsPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LogIn()),
                  (route) =>
                      false, // This removes all previous routes from the stack
                );
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 0, 45, 81),
                        Color.fromARGB(255, 0, 144, 247),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: const Icon(
                    Icons.logout,
                    color: Colors.white, // Base color to act as the mask
                    size: 30,
                  ),
                ),
              ),
            ),
            title: Text(
              'LogOut',
              style: GoogleFonts.abhayaLibre(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
