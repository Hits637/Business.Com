import 'dart:developer';

import 'package:business_dot_com/Components/text_editing_controller.dart';
import 'package:business_dot_com/Controller/data_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Controller/comp_image_dao.dart';
import '../../../../model/comp_detail_model.dart';
import '../../../../Components/custom_snackbar.dart';
import '../../dashboard.dart';
import 'clear_text.dart';

class PartnerFinishButton {
  Widget finishButton(BuildContext context, {required String? email}) {
    //final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        partner = true;
        if (partnerRequirment.text.trim().isNotEmpty &&
            partnerMinQualification.text.trim().isNotEmpty &&
            partnerSkills.text.trim().isNotEmpty &&
            partnerStakes.text.trim().isNotEmpty) {
          Map<String, dynamic> data = {
            "CompLogo": url,
            "OrganizationName": organizationName.text.trim(),
            "OwnerName": ownerName.text.trim(),
            "Domain": domain.text.trim(),
            "Organization Type": organizationType.text.trim(),
            "Establishment Year": establishmentYear.text.trim(),
            "GSTIN No": gstinNo.text.trim(),
            "Revenue": revenue.text.trim(),
            "Address": address.text.trim(),
            "city": city.text.trim(),
            "state": state.text.trim(),
            "pitch": pitchTextEditingController.text.trim(),
            "Description": descriptionTextEditingController.text.trim(),
            "Website": websiteTextEditingController.text.trim(),
            "Requirement": partnerRequirment.text.trim(),
            "Min Qualification": partnerMinQualification.text.trim(),
            "Skills": partnerSkills.text.trim(),
            "stake": partnerStakes.text.trim(),
            "investmentRange": investorInvestmentRange.text.trim(),
            "mobileNo": mobileNo.text.trim()
          };
          FirebaseFirestore.instance.collection("CompanyDetails").add(data);
          log("Stored Succesfully");
          log("$email");
          log("data");
          log("${domain.text}");

          ClearText.clearText();

          QuerySnapshot response = await FirebaseFirestore.instance
              .collection("CompanyDetails")
              .get();
          log("harshal");
          log("Domain: ${domain.text}");
          log("$response");
          // domain1.clear();
          // domain2.clear();
          // domain3.clear();
          // domain4.clear();
          // Clear all sublists
          for (var sublist in majorCompDetailModelList) {
            sublist.clear();
          }

          //majorCompDetailModelList.clear();

          log("Total documents: ${response.docs.length}");

          Map<String, int> domainIndexMap = {};
          for (int i = 0; i < domainList.length; i++) {
            domainIndexMap[domainList[i]] = i;
          }

          for (int i = 0; i < response.docs.length; i++) {
            // Extract and validate the domain
            String? domain = response.docs[i]["Domain"];
            if (domain == null || domain.isEmpty) {
              log("Document missing Domain field. Skipping...");
              break;
            }

            // Check if the domain is already in the set
            int? domainIndex = domainIndexMap[domain];
            if (domainIndex == null) {
              // New domain found
              domainSet.add(domain);
              domainList.add(domain);
              domainIndex = domainList.length - 1; // Index of the new domain
              majorCompDetailModelList.add([]); // Add new list for this domain
              domainIndexMap[domain] = domainIndex;
            }

            // Add the document to the correct list
            majorCompDetailModelList[domainIndex].add(
              CompDetailModel(
                  organizationName:
                      response.docs[i]['OrganizationName'] ?? 'N/A',
                  city: response.docs[i]['city'] ?? 'N/A',
                  pitchTextEditingController:
                      response.docs[i]['pitch'] ?? 'N/A',
                  revenue: response.docs[i]['Revenue'] ?? 'N/A',
                  compLogo: response.docs[i]['CompLogo'] ?? 'N/A',
                  ownerName: response.docs[i]['OwnerName'] ?? 'N/A',
                  domain: domain,
                  organizationType:
                      response.docs[i]['Organization Type'] ?? 'N/A',
                  establishmentYear:
                      response.docs[i]['Establishment Year'] ?? 'N/A',
                  gstinNo: response.docs[i]['GSTIN No'] ?? 'N/A',
                  address: response.docs[i]['Address'] ?? 'N/A',
                  state: response.docs[i]['state'] ?? 'N/A',
                  descriptionTextEditingController:
                      response.docs[i]['Description'] ?? 'N/A',
                  partnerSkills: response.docs[i]['Skills'] ?? 'N/A',
                  websiteTextEditingController:
                      response.docs[i]['Website'] ?? 'N/A',
                  partnerMinQualification:
                      response.docs[i]['Min Qualification'] ?? 'N/A',
                  partnerRequirment: response.docs[i]['Requirement'] ?? 'N/A',
                  partnerStakes: response.docs[i]['stake'] ?? 'N/A',
                  investmentRange: response.docs[i]['investmentRange'] ?? "",
                  mobileNo: response.docs[i]['mobileNo'] ?? 'N/A'),
            );
          }

          // Log the results
          log("Final majorCompDetailModelList: ${majorCompDetailModelList}");

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
        } else {
          CustomSnackBar.showCustomSnackbar(
            title: "Oppsss...",
            message: "Please enter valid Data",
          );
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            // colors for gradient
            colors: [
              Color.fromARGB(255, 0, 45, 81),
              Color.fromARGB(255, 0, 144, 247),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 145, 190, 243).withOpacity(1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(5, 8),
            )
          ],
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(32, 103, 234, 1),
        ),
        child: const Center(
          child: Text(
            "Finish",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
