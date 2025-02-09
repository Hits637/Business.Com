import 'package:business_dot_com/view/Dashboard/Drawer/Gov_Schemes/all_scheme_chatagory.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';

class CBOI extends StatefulWidget {
  const CBOI({super.key});

  @override
  State<CBOI> createState() => _CBOIState();
}

class _CBOIState extends State<CBOI> {
  final List<Map<String, dynamic>> schemesData = [
    {
      "title": "Cent Kalyani Scheme",
      "ministry": "Central Bank of India",
      "sector": "Women Entrepreneuship",
      "brief":
          "Cent-Kalyani is an initiative by the Central Bank of India aimed at empowering women entrepreneurs and businesses. This initiative is launched to encourage Women Entrepreneurs to start new projects or expand and modernize the existing unit.",
      "eligibility criteria":
          "New as well as Existing Women entrepreneurs for her Micro/Small enterprise ( as defined under MSME Act- 2006) .i.e engaged in manufacturing and service activity for eg. Handloom weaving Handicraft, Food-Processing, Garment making, etc. Professionals & Self-employed women - Doctors, Chartered Accountants, and Engineers or trained in Art or Craft, etc.Health/Beauty/clinics/Dieticians/Fashion Designing Beauty Parlors. Small Business-Small/lunch/canteen, mobile restaurant, circulating/ library/tailoring/Day Creaches for children, Tailoring/Typing/STD/Xerox booth, etc.Transport Operators- Three wheelers/Four wheelers. (Retail Trade/Education and Training Institute/Self Help Group not eligible)",
      "quantum/size":
          "QUANTUM OF FINANCE: Maximum Rs. 100 Lacs.MARGIN: 20%RATE OF INTEREST: Concession in Rate of interest - Loan up to Rs. 10 Lacs - MCLR + 0.25% Loan above Rs. 10 Lacs and up to Rs.100 Lacs - MCLR + 0.50% Additional Interest concession of 0.25% if an account is rated by an external agency.",
      "benefits":
          "Term Loan Fund Based Working capital Facility - Overdraft/Cash/Credit Non-Fund Based Working Capital - Letter of Credit/ Letter Of Guarantee etcFor specific details about the initiative and its benefits, please visit the official website.",
      "tags": ["Credit Benefit"],
      "tenure": "Active",
      "link": "https://www.centralbankofindia.co.in/en/Cent_Kalyani",
      "isExpanded": false,
    },
    {
      "title": "Women Entrepreneur Cell",
      "ministry": "Central Bank of India",
      "sector": "Agriculture, Retail",
      "brief":
          "The Women Entrepreneur Cell is an initiative by the Central Bank of India dedicated to supporting and promoting women entrepreneurs. The aim is to emerge as a key player for Women Empowerment by enhancing their capabilities in Entrepreneurship, Responsive to their special credit needs, and offering them the best financial services and best Banking practices.",
      "eligibility criteria":
          "Women Entrepreneurs are eligible for this scheme.",
      // "quantum/size":
      //     "For Incubation group Rs 3 lakhs commercialization grant for 120 startups, additional Rs.7 lakhs for top 20 performers.For Pre-incubation group Rs 1 lakhs prototype grant for 150 startups, additional Rs.4 lakhs for top 25 performers.",
      "benefits":
          "Cater to women entrepreneurs across all levels of economic activity, with a focus on MSMEs, agriculture, and retail sectors in alignment with government priorities.Participants gain access to funding, expert guidance, and a supportive community of women entrepreneurs.To support new and existing Women Entrepreneurs in the expansion and modernization of their unit.",
      "tags": ["Funding"],
      "Notes":
          "To cater to Women Entrepreneurs at all levels of Economic activity with emphasis on MSME, Agriculture, and Retail in sinc with Govt. priorities.To identify, encourage, and assist aspiring Women Entrepreneurs to start an Enterprise professionally.To guide and support existing Women Entrepreneurs in the expansion and modernization of their unit.To coordinate with Government Non-Government Organisations Association to bring more and more Women Entrepreneurs into Bank’s fold.",
      "tenure": "Active",
      "link": "https://www.centralbankofindia.co.in/en/Women_Entrepreneur_Cell",
      "isExpanded": false,
    },
    {
      "title": "CENT STAND UP INDIA",
      "ministry": "Central Bank of India",
      "sector": "Manufacturing",
      "brief":
          "CENT STAND UP INDIA is an initiative by the Central Bank of India aimed at supporting entrepreneurship and business initiatives for individuals and communities belonging to Scheduled Castes (SC) and Scheduled Tribes (ST). The purpose is to set up a new Green Field New Enterprise in the manufacturing, trading, or services sector by SC/ST/ Women entrepreneurs. Please note that the scheme is not applicable for existing units or expansion purposes.",
      "eligibility criteria":
          "SC/ST and /or Woman Entrepreneurs, above 18 years of age. In case of non-individual enterprises, 51% of the shareholding and controlling stake should be held by either SC/ST and/or Women Entrepreneur.",
      "quantum/size":
          "Max Finance 10 lakh to 1 CRORE Margin 25% Interest Rate Floating 7.80% to 12.40% Loan Term 84 months",
      "benefits": "null",
      "tags": ["CC cum TL composite loan"],
      "tenure": "Active",
      "link": "https://www.centralbankofindia.co.in/en/cent-stand-up-india",
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
          "CBOI Schemes",
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
