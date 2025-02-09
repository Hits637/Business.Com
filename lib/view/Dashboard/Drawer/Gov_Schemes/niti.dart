import 'package:business_dot_com/view/Dashboard/Drawer/Gov_Schemes/all_scheme_chatagory.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';

class NitiAayog extends StatefulWidget {
  const NitiAayog({super.key});

  @override
  State<NitiAayog> createState() => _NitiAayogState();
}

class _NitiAayogState extends State<NitiAayog> {
  final List<Map<String, dynamic>> schemesData = [
    {
      "title": "The Women Entrepreneurship Platform (WEP)",
      "ministry": "Niti Aayog",
      "sector": "Women Entrepreneuship",
      "brief":
          "NITI Aayog has launched a Women Entrepreneurship Platform (WEP) to provide an ecosystem for budding & existing women entrepreneurs across the country. SIDBI has partnered with NITI Aayog to assist in this initiative.",
      "eligibility criteria":
          "Potential women entrepreneurs, in collaboration with partner organizations can apply for the scheme",
      // "quantum/size":
      //     "For Incubation group Rs 3 lakhs commercialization grant for 120 startups, additional Rs.7 lakhs for top 20 performers.For Pre-incubation group Rs 1 lakhs prototype grant for 150 startups, additional Rs.4 lakhs for top 25 performers.",
      "benefits":
          "WEP enables key partnerships to bring crucial content, workshops, campaigns and other avenues of learning and growth to its users from trailblazers in the industry.",
      "tags": ["Acceleration"],
      "tenure": "Active",
      "link": "https://wep.gov.in/",
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
          "NitiAayog Schemes",
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
                  color: Colors.blue,
                  width: 1,
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
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                    Text(
                      scheme['ministry'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 5),

                    // Key Sector
                    const Text(
                      "Key Sector Covered:",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                    Text(
                      scheme['sector'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Brief
                    const Text(
                      "Brief:",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                    Text(
                      scheme['brief'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Benefits
                    const Text(
                      "Benefits:",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                    Text(
                      scheme['benefits'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Tenure
                    const Text(
                      "Tenure:",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                    Text(
                      scheme['tenure'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Conditionally show expanded content
                    if (scheme["isExpanded"] ?? false) ...[
                      const SizedBox(height: 10),
                      const Text(
                        "Eligibility Criteria:",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17),
                      ),
                      const Text(
                        "Please refer to official guidelines.",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Notes:",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17),
                      ),
                      const Text(
                        "Additional information about the scheme can be found here.",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
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
                              fontWeight: FontWeight.w300,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      "Link to Application:",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
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
                          //color: Colors.blue,
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
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
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
