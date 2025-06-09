import 'dart:developer';

import 'package:business_dot_com/Components/text_editing_controller.dart';
import 'package:business_dot_com/Controller/comp_image_dao.dart';
import 'package:business_dot_com/Controller/data_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:http/http.dart';

import '../../../../model/comp_detail_model.dart';
import '../../../../Components/custom_snackbar.dart';
import '../../dashboard.dart';
import 'clear_text.dart';

class InvestorFinishButton {
  Widget finishButton(BuildContext context, {required String? email}) {
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    return GestureDetector(
      onTap: () async {
        if (investorRequirement.text.trim().isNotEmpty &&
            investorMinQualification.text.trim().isNotEmpty &&
            investorSkills.text.trim().isNotEmpty &&
            investorStakes.text.trim().isNotEmpty &&
            investorInvestmentRange.text.trim().isNotEmpty) {
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
            "Requirement": investorRequirement.text.trim(),
            "Min Qualification": investorMinQualification.text.trim(),
            "Skills": investorSkills.text.trim(),
            "stake": investorStakes.text.trim(),
            "investmentRange": investorInvestmentRange.text.trim(),
            "mobileNo": mobileNo.text.trim()
          };
          saveCompanyData(data, userId!);
          log("Stored Succesfully");
          log("$email");
          log("$data");

          ClearText.clearText();

          await DataController.fetchCompData();
             Navigator.of(context).popUntil((route) => route.isFirst,);

        } else {
          CustomSnackBar.showCustomSnackbar(
            title: "Oppsss...",
            message: "Please enter valid Data",
          );
        }
      },
      child: Container(
        height: 45,
        width: 120,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(5, 8),
            )
          ],
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(32, 103, 234, 1),
        ),
        child: const Center(
          child: Text(
            "Finish",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
