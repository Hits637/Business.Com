import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
        ),
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
          "Help & Support",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      "assets/Gov_schemes_logo/help.jpg",
                      height: 200.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16.0),
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
                      "How can we assist you?",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),

            // FAQs Section
            GradientText(
              "Frequently Asked Questions",
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
            const SizedBox(height: 8.0),
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
            const SizedBox(height: 24.0),

            // Contact Support Section
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
                "Contact Support",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Need further assistance? Our support team is here to help:",
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const ListTile(
              leading: Icon(Icons.email, color: Color.fromARGB(255, 0, 45, 81)),
              title: Text("Email: Ruchikapatil66@gmail.com"),
            ),
            const ListTile(
              leading:
                  Icon(Icons.phone, color: Color.fromARGB(255, 0, 144, 247)),
              title: Text("Phone: +918999224867"),
            ),

            const SizedBox(height: 24.0),

            // Guides and Resources Section
            GradientText(
              "Guides & Resources",
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              colors: const [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Explore our detailed guides to get the most out of the app:",
              style: TextStyle(fontSize: 16.0),
            ),
            const ListTile(
              leading:
                  Icon(Icons.book, color: Color.fromARGB(255, 0, 144, 247)),
              title: Text("Getting Started with business.com"),
            ),
            const ListTile(
              leading:
                  Icon(Icons.search, color: Color.fromARGB(255, 0, 45, 81)),
              title: Text("How to Find the Right Investor"),
            ),
            const ListTile(
              leading:
                  Icon(Icons.link, color: Color.fromARGB(255, 0, 144, 247)),
              title: Text("Connecting with Government Schemes"),
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
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            answer,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
