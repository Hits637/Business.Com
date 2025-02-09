import 'package:business_dot_com/view/Dashboard/Drawer/Gov_Schemes/all_scheme_chatagory.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';

class EasternRegion extends StatefulWidget {
  const EasternRegion({super.key});

  @override
  State<EasternRegion> createState() => _EasternRegionState();
}

class _EasternRegionState extends State<EasternRegion> {
  final List<Map<String, dynamic>> schemesData = [
    {
      "title": "North East Entrepreneurs Development (NEED)",
      "ministry": "Ministry of Development of North Eastern Region",
      "sector": "North East",
      "brief":
          "The North East Entrepreneurs Development (NEED) initiative is an effort by the Ministry of Development of North Eastern Region to support entrepreneurship and business development in the North Eastern Region of India. The scheme has been formulated to help first-generation entrepreneurs who are short of equity. New projects in Micro and Small Enterprises, expansion, and modernization of existing units. Technical qualification of the promoter in the relevant field is a pre-requisite.",
      "eligibility criteria":
          "First-generation entrepreneurs, existing entrepreneurs, proprietary & partnership concerns and companies. Technical qualification of the promoter in the relevant field is a pre-requisite.",
      "quantum/size":
          "For Incubation group Rs 3 lakhs commercialization grant for 120 startups, additional Rs.7 lakhs for top 20 performers.For Pre-incubation group Rs 1 lakhs prototype grant for 150 startups, additional Rs.4 lakhs for top 25 performers.",
      "benefits":
          "Term loan up to a maximum of 75% of the project cost including one cycle of working capital in deserving cases. Promoter’s contribution minimum of 25% of the project cost.For specific details about NEED and its benefits, please visit the official website.",
      "tags": ["Credit Benefit Schemes"],
      "tenure": "Active",
      "notes":
          "The scheme has been formulated to help first-generation entrepreneurs who are short of equity. New projects in Micro and Small Enterprises, expansion, and modernization of existing units. Technical qualification of the promoter in the relevant field is a pre-requisite.",
      "link": "https://my.msme.gov.in/MyMsmeMob/MsmeScheme/Pages/7_1_6.html",
      "isExpanded": false,
    },
    {
      "title": "North-East Handloom Handicrafts (NEHH)",
      "ministry": "Ministry of Development of North Eastern Region",
      "sector": "Technology",
      "brief":
          "The North-East Handloom Handicrafts (NEHH) initiative is an endeavor by the Ministry of Development of North Eastern Region. The aim is to promote enterprises in handlooms and handicrafts sector and provide a platform for sustainable economic growth by promoting the local artisans.",
      "eligibility criteria":
          "The North-East Handloom Handicrafts (NEHH) initiative is open to individuals, artisans, handloom weavers, and handicraft producers in the North Eastern Region of India.Applicants should be interested in promoting and enhancing their handloom and handicrafts businesses.Specific eligibility requirements may vary based on the programs and opportunities offered under NEHH.",
      "quantum/size":
          "NSDF has released Rs. 5029.63 crores to NSDC towards skill development programs including National Skill Certification and Monetary Reward Scheme (STAR) and UDAAN Scheme (J&K oriented).",
      "benefits":
          "This scheme provides benefits like fostering innovation and research through Technology Development Funds, safeguarding intellectual property with Patent Protection Funds, accessing external technologies via Technology In-Licensing Funds, mitigating risks during scaling with Technology Scale-up Validation De-risking Funds, expanding into new markets using Market Entry Funds, and fueling growth through Expansion Funds.",
      "tags": ["Credit Benefit"],
      "tenure": "Active",
      "notes":
          "The scheme aims to promote enterprises in handlooms and handicrafts sector and provide a platform for sustainable economic growth by promoting the local artisans.",
      "link":
          "https://funding.venturecenter.co.in/viewrecord.php?srn=BI20200724084616",
      "isExpanded": false,
    },
    {
      "title": "Working Capital Term Loan (WCTL)",
      "ministry": "Ministry of Development of North Eastern Region",
      "sector": "North East",
      "brief":
          "NEDFi provides financial assistance in the form of gap funding to eligible contractor firms companies for contract work execution. Working capital term loan assistance is given in the form of gap funding. Interest rate is fixed based on prime lending rate with plus or spread as per the credit worthiness of the borrower, risk perception, rating, and other relevant factors.",
      "eligibility criteria": "Eligible contractor firms and companies.",
      "quantum/size":
          "For Incubation group Rs 3 lakhs commercialization grant for 120 startups, additional Rs.7 lakhs for top 20 performers.For Pre-incubation group Rs 1 lakhs prototype grant for 150 startups, additional Rs.4 lakhs for top 25 performers.",
      "benefits": "Financial assistance in the form of gap funding",
      "tags": ["Credit Benefit"],
      "tenure": "Active",
      "notes":
          "The scheme aims to promote enterprises in handlooms and handicrafts sector and provide a platform for sustainable economic growth by promoting the local artisans.",
      "link":
          "https://www.federalbank.co.in/corporate-finance/working-capital-term-loan#:~:text=Working%20Capital%20Term%20Loan%20(WCTL)%20is%20provided%20to%20extend%20long,capital%20credit%20facilities%20to%20entrepreneurs.",
      "isExpanded": false,
    },
    {
      "title": "Working Capital Term Loan (WCTL) for Contract Finance",
      "ministry": "Ministry of Development of North Eastern Region",
      "sector": "North East",
      "brief":
          "NEDFi provides financial assistance in the form of gap funding to eligible contractor firms/companies for contract work execution. Working capital term loan assistance is given in the form of gap funding. Interest rate is fixed based on prime lending rate with plus or spread as per the credit worthiness of the borrower, risk perception, rating, and other relevant factors.",
      "eligibility criteria": "Eligible contractor firms and companies.",
      "quantum/size": "Null",
      "benefits": "Financial assistance in the form of gap funding",
      "tags": ["Null"],
      "notes": "Null",
      "tenure": "Active",
      "link": "https://my.msme.gov.in/MyMsmeMob/MsmeScheme/Pages/7_1_10.html",
      "isExpanded": false,
    },
    {
      "title":
          "Equipment Finance (Northeastern Development Finance Corporation Ltd Schemes)",
      "ministry": "Ministry of Development of North Eastern Region",
      "sector": "North East",
      "brief":
          "This scheme intends to provide financial assistance for acquiring specific machinery/ equipment by financially sound and profit-making companies having a good credit record. The proposed unit should be located in any of the eight North Eastern States.",
      "eligibility criteria":
          "Corporates with minimum 3 years of profitable operations for NEDFi assisted units, in case of other units the unit should have minimum 5 years of operations.",
      "quantum/size": "Null",
      "benefits":
          "Minimum: Rs.25 lakh, Maximum: Rs.10 Crores financial assistance",
      "tags": ["Null"],
      "tenure": "Active",
      "notes": "Null",
      "link":
          "https://my.msme.gov.in/MyMsmeMob/MsmeScheme/NorthEasternDevlop.htm",
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
          "EasternRegion Schemes",
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
