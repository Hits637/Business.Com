import 'dart:developer';

import 'package:business_dot_com/model/b2b_model.dart';
import 'package:business_dot_com/view/Dashboard/Functionalities/B2B/widgets/texteditingcontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../Controller/comp_image_dao.dart';
import '../../../../../Components/custom_snackbar.dart';
import '../b2b_form1.dart';
import '../b2b_page.dart';

class Submitbutton {
  Widget submitButton({required BuildContext context, required String? email}) {
    return GestureDetector(
      onTap: () async {
        if (organizationName.text.trim().isNotEmpty &&
            ownerName.text.trim().isNotEmpty &&
            domain.text.trim().isNotEmpty &&
            organizationType.text.trim().isNotEmpty &&
            businessColab.text.trim().isNotEmpty &&
            gstinNo.text.trim().isNotEmpty &&
            moneyOffered.text.trim().isNotEmpty &&
            employeerequire.text.trim().isNotEmpty &&
            address.text.trim().isNotEmpty &&
            colabwithBusiness.text.trim().isNotEmpty &&
            colabarationType.text.trim().isNotEmpty &&
            city.text.trim().isNotEmpty &&
            state.text.trim().isNotEmpty) {
          Map<String, dynamic> data = {
            "compLogo": url,
            "organizationName": organizationName.text.trim(),
            "ownerName": ownerName.text.trim(),
            "domain": domain.text.trim(),
            "organizationType": organizationType.text.trim(),
            "businessColab": businessColab.text.trim(),
            "gstinNo": gstinNo.text.trim(),
            "moneyOffered": moneyOffered.text.trim(),
            "employeerequire": employeerequire.text.trim(),
            "address": address.text.trim(),
            "colabwithBusiness": colabwithBusiness.text.trim(),
            "colabarationType": colabarationType.text.trim(),
            "city": city.text.trim(),
            "state": state.text.trim(),
          };
          FirebaseFirestore.instance.collection("B2B Details").add(data);
          log("Stored Succesfully");
          log("$email");
          log("data");

          QuerySnapshot response =
              await FirebaseFirestore.instance.collection("B2B Details").get();
          b2bDetailList.clear();

          for (int i = 0; i < response.docs.length; i++) {
            b2bDetailList.add(
              B2bModel(
                  compLogo: response.docs[i]['compLogo'] ?? 'N/A',
                  organizationName:
                      response.docs[i]['organizationName'] ?? 'N/A',
                  ownerName: response.docs[i]['ownerName'] ?? 'N/A',
                  domain: response.docs[i]['domain'] ?? 'N/A',
                  organizationType:
                      response.docs[i]['organizationType'] ?? 'N/A',
                  businessColab: response.docs[i]['businessColab'] ?? 'N/A',
                  gstinNo: response.docs[i]['gstinNo'] ?? 'N/A',
                  moneyOffered: response.docs[i]['moneyOffered'] ?? 'N/A',
                  employeerequire: response.docs[i]['employeerequire'] ?? 'N/A',
                  address: response.docs[i]['address'] ?? 'N/A',
                  colabwithBusiness:
                      response.docs[i]['colabwithBusiness'] ?? 'N/A',
                  colabarationType:
                      response.docs[i]['colabarationType'] ?? 'N/A',
                  city: response.docs[i]['city'] ?? 'N/A',
                  state: response.docs[i]['state'] ?? 'N/A'),
            );
          }
          companyImage = null;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => B2b(
                email: email,
              ),
            ),
          );
        } else {
          CustomSnackBar.showCustomSnackbar(
            title: "Oppsss...",
              message: "Please enter valid Data");
        }
      },
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width - 40,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 45, 81),
              Color.fromARGB(255, 0, 144, 247),
            ],
          ),
        ),
        child: const Text(
          "Submit",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
