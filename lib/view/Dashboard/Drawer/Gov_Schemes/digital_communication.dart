import 'package:business_dot_com/view/Dashboard/Drawer/Gov_Schemes/all_scheme_chatagory.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';

class DigitalCommunication extends StatefulWidget {
  const DigitalCommunication({super.key});

  @override
  State<DigitalCommunication> createState() => _DigitalCommunicationState();
}

class _DigitalCommunicationState extends State<DigitalCommunication> {
  List<Map<String, dynamic>> schemesData = [
    {
      "title": "Digital Communication Innovation Square",
      "ministry": "Ministry of Communications",
      "department": "Department of Telecommunications",
      "sector": "Communication",
      "brief":
          "The Digital Communication Innovation Square (DCIS) is an initiative that is intended to catalyze startup culture and build a strong and inclusive ecosystem for innovation and entrepreneurship in India. TCOE India is implementing the Scheme on behalf of the Department of Telecom. The Implementing Agency (IA) is working under the overall supervision of the Apex Committee and guidelines issued by the DoT.",
      "eligibility":
          "The Digital Communication Innovation Square (DCIS) is open to startups defined by DPIIT and are working towards development or improvement of products and processes with scalable business models. Specific eligibility requirements can be viewed in the official document of the policy.",
      "fundSize": "124 Crs of Budget Outlay",
      "benefitTags": "Regulatory",
      "tenure": "Active",
      "benefits":
          "DCIS offers a platform for innovators to showcase their digital communication solutions and ideas. Benefits include assistance in research, design, development, proof of concept testing, IPR creation, pilot project, and manufacturing i.e. complete value chain to make India a global hub for the production of telecommunication equipment and a center for digital communication services.",
      "notes":
          "To promote the ecosystem for research, design, development, proof of concept testing, Minimum Viable Product (MVP), Intellectual Property Rights (IPR) creation, pilot project, and manufacturing i.e. complete value chain to make India a global hub for the production of telecommunication equipment and a center for digital communication services.",
      "link":
          "https://dcis.dot.gov.in/assets/document/DCIS_Guidelines-2023.pdf",
      "isExpanded": false,
    }
  ];

  Future<void> _launchApplicationURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AllSchemeChatagory()));
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
        title: const Text(
          "DigitalCommunication Schemes",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: schemesData.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> scheme = entry.value;

            return Container(
              width: MediaQuery.of(context).size.width - 20,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 3,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.arrow_right_outlined,
                          color: Colors.orange,
                          size: 35,
                        ),
                        Expanded(
                          child: GradientText(
                            scheme['title'],
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                            colors: [
                              Color.fromARGB(255, 0, 45, 81),
                              Color.fromARGB(255, 0, 144, 247),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Ministry
                    const Text(
                      "Ministry:",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
                    ),
                    Text(
                      scheme['ministry'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 5),

                    // Key Sector
                    const Text(
                      "Key Sector Covered:",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
                    ),
                    Text(
                      scheme['sector'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Brief
                    const Text(
                      "Brief:",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
                    ),
                    Text(
                      scheme['brief'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Benefits
                    const Text(
                      "Benefits:",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
                    ),
                    Text(
                      scheme['benefits'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Tenure
                    const Text(
                      "Tenure:",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
                    ),
                    Text(
                      scheme['tenure'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Conditionally show expanded content
                    if (scheme["isExpanded"] ?? false) ...[
                      const SizedBox(height: 10),
                      const Text(
                        "Eligibility Criteria:",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 17),
                      ),
                      const Text(
                        "Please refer to official guidelines.",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Notes:",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 17),
                      ),
                      const Text(
                        "Additional information about the scheme can be found here.",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],

                    Container(
                      width: MediaQuery.of(context).size.width - 20,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            scheme["isExpanded"] =
                                !(scheme["isExpanded"] ?? false);
                          });
                        },
                        child: Text(
                          (scheme["isExpanded"] ?? false)
                              ? "Read less..."
                              : "Read more...",
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      "Link to Application:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => _launchApplicationURL(scheme["link"]),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            // colors for gradient
                            colors: [
                              Color.fromARGB(255, 0, 45, 81),
                              Color.fromARGB(255, 0, 144, 247),
                            ],
                          ),
                        ),
                        child: const Text(
                          "Visit Application Link",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
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
          }).toList(),
        ),
      ),
    );
  }
}
