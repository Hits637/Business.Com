import 'package:business_dot_com/view/Dashboard/Drawer/Gov_Schemes/all_scheme_chatagory.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Meity extends StatefulWidget {
  const Meity({super.key});

  @override
  State<Meity> createState() => _MeityState();
}

class _MeityState extends State<Meity> {
  final List<Map<String, dynamic>> schemesData = [
    {
      "title": "Software Technology Park (STP) Scheme",
      "ministry": "Ministry of Electronics and Information Technology (MeitY)",
      "sector": "IT and Service Sector",
      "brief":
          "The STP Scheme is a 100% export-oriented scheme for the development and export of computer software and services.",
      "benefits":
          "Duty exemption on import of hardware and software, tax benefits, single window clearance.",
      "tags": ["Facilitation Benefits"],
      "tenure": "Active",
      "link": "https://stpi.in/en/stp-scheme",
      "isExpanded": false,
    },
    {
      "title": "Electronics Hardware Technology Park Scheme",
      "ministry": "Ministry of Electronics and Information Technology (MeitY)",
      "sector": "Hardware",
      "brief":
          "The STP (Software Technology Park) and EHTP (Electronic Hardware Technology Park) schemes are initiatives aimed at promoting software and electronics hardware development for exports in India.",
      "benefits":
          "Duty-free import of capital goods and raw materials, simplified customs procedures, and tax incentives.",
      "tags": ["Regulatory"],
      "tenure": "Active",
      "link": "https://taxindiaonline.com/RC2/pdfdocs/cm/cm22d.pdf",
      "isExpanded": false,
    },
    {
      "title": "Domain-specific Centres of Excellence",
      "ministry": "Ministry of Electronics and Information Technology (MeitY)",
      "sector": "Deep Tech/Technology",
      "brief":
          "MeitY had envisaged and operationalized a clutch of Centres of Excellence (CoEs) in diverse areas of national interest across India.",
      "benefits":
          "Infrastructure support, coaching, mentorship, technology support, funding to emerging startups.",
      "tags": ["Infrastructure"],
      "tenure":
          "Over a period of 5 years (07.12.2018 to 07.12.2023, subject to extension)",
      "link":
          "https://www.meity.gov.in/content/centres-excellence-coe-projects",
      "isExpanded": false,
    },
    {
      "title": "Genesis",
      "ministry": "Ministry of Electronics and Information Technology (MeitY)",
      "sector": "Deep Tech/Technology",
      "brief":
          "The Digital India-GENESIS program discovers, supports, and grows startups in Tier-II and Tier-III cities.",
      "benefits":
          "Equity-linked seed investment, funding for global expansion, and collaborative engagement.",
      "tags": ["Funding"],
      "tenure": "2022-2027",
      "link": "https://msh.meity.gov.in/assets/About%20GENESIS_Scheme.pdf",
      "isExpanded": false,
    },
    {
      "title": "Duty Exemption And Remission Scheme",
      "ministry": "Ministry of Electronics and Information Technology (MeitY)",
      "sector": "Import",
      "brief":
          "The scheme enables duty-free import of inputs for export production.",
      "benefits": "Duty-free import of inputs and remission of duties.",
      "tags": ["Facilitation Benefit"],
      "tenure": "Active",
      "link":
          "https://content.dgft.gov.in/Website/FTP%20Chapter%204%20as%20on%20June%2030%202019.pdf",
      "isExpanded": false,
    },
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
          "MeitY Schemes",
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
