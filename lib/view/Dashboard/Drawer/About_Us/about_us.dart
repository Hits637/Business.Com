import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          "About Us",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "assets/images/1st image.webp",
                    height: 170.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                // const SizedBox(height: 16.0),

                // About Us Section

                const SizedBox(height: 20),
                const Text(
                  "At business.com, we connect businesses with opportunities to grow, innovate, and thrive. From small-scale entrepreneurs to industry leaders, we provide tools and networks to unlock your true potential.",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // "We Are Providing" Section with Bullet Points
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 45, 81),
                  Color.fromARGB(255, 0, 144, 247),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: const Text(
                "We Are Providing",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BulletPoint(
                    text: "Partner Connect - Build strong business alliances."),
                BulletPoint(
                    text:
                        "Investor Opportunities - Attract the right investments for growth."),
                BulletPoint(
                    text:
                        "Access to Government Schemes - Unlock supportive initiatives."),
                BulletPoint(
                    text:
                        "Business-to-Business Collaboration - Expand through strategic partnerships."),
              ],
            ),
            

            const SizedBox(height: 24.0),
            // Our Mission Section
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 45, 81),
                  Color.fromARGB(255, 0, 144, 247),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: const Text(
                "Our Mission",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                const Text(
                  "To create a dynamic platform that fosters collaboration, drives growth, and builds an ecosystem where businesses can thrive together.",
                  style: TextStyle(fontSize: 16.0),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "assets/images/ourMisson.jpg",
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            //const SizedBox(height: 16.0),
            const SizedBox(height: 24.0),

            // Slogan Section
            Center(
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Text(
                  "Empowering Businesses, Connecting Opportunities, Fueling Growth.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Custom Widget for Bullet Points
class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "• ",
            style: TextStyle(fontSize: 20.0, color: Colors.black),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
