import 'dart:developer';

import 'package:business_dot_com/model/b2b_model.dart';
import 'package:business_dot_com/model/comp_detail_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

final DataController controller = Get.put(DataController());
Set<String> domainSet = {};

List<List<CompDetailModel>> majorCompDetailModelList =
    List.generate(domainSet.length, (_) => []);

List domainList = domainSet.toList();

class DataController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchCompData();
    fetchB2BData();
  }

  void fetchCompData() async {
    await Future.delayed(Duration(milliseconds: 200));
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("CompanyDetails").get();

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
        continue;
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
            organizationName: response.docs[i]['OrganizationName'] ?? 'N/A',
            city: response.docs[i]['city'] ?? 'N/A',
            pitchTextEditingController: response.docs[i]['pitch'] ?? 'N/A',
            revenue: response.docs[i]['Revenue'] ?? 'N/A',
            compLogo: response.docs[i]['CompLogo'] ?? 'N/A',
            ownerName: response.docs[i]['OwnerName'] ?? 'N/A',
            domain: response.docs[i]['Domain'] ?? 'N/A',
            organizationType: response.docs[i]['Organization Type'] ?? 'N/A',
            establishmentYear: response.docs[i]['Establishment Year'] ?? 'N/A',
            gstinNo: response.docs[i]['GSTIN No'] ?? 'N/A',
            address: response.docs[i]['Address'] ?? 'N/A',
            state: response.docs[i]['state'] ?? 'N/A',
            descriptionTextEditingController:
                response.docs[i]['Description'] ?? 'N/A',
            partnerSkills: response.docs[i]['Skills'] ?? 'N/A',
            websiteTextEditingController: response.docs[i]['Website'] ?? 'N/A',
            partnerMinQualification:
                response.docs[i]['Min Qualification'] ?? 'N/A',
            partnerRequirment: response.docs[i]['Requirement'] ?? 'N/A',
            partnerStakes: response.docs[i]['stake'],
            investmentRange: response.docs[i]['investmentRange'] ?? "N/a",
            mobileNo: response.docs[i]['mobileNo'] ?? 'N/A'),
      );
    }
    log("Final majorCompDetailModelList: $majorCompDetailModelList");
  }

  void fetchB2BData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    QuerySnapshot b2bResponse =
        await FirebaseFirestore.instance.collection("B2B Details").get();

    for (int i = 0; i < b2bResponse.docs.length; i++) {
      b2bDetailList.add(
        B2bModel(
            organizationName: b2bResponse.docs[i]['organizationName'] ?? 'N/A',
            ownerName: b2bResponse.docs[i]['ownerName'] ?? 'N/A',
            domain: b2bResponse.docs[i]['domain'] == ""
                ? "N/A"
                : b2bResponse.docs[i]['domain'],
            organizationType: b2bResponse.docs[i]['organizationType'] ?? 'N/A',
            businessColab: b2bResponse.docs[i]['businessColab'] ?? 'N/A',
            gstinNo: b2bResponse.docs[i]['gstinNo'] ?? 'N/A',
            moneyOffered: b2bResponse.docs[i]['moneyOffered'] ?? 'N/A',
            employeerequire: b2bResponse.docs[i]['employeerequire'] ?? 'N/A',
            address: b2bResponse.docs[i]['address'] ?? 'N/A',
            colabwithBusiness:
                b2bResponse.docs[i]['colabwithBusiness'] ?? 'N/A',
            colabarationType: b2bResponse.docs[i]['colabarationType'] ?? 'N/A',
            city: b2bResponse.docs[i]['city'] ?? 'N/A',
            state: b2bResponse.docs[i]['state'] ?? 'N/A',
            compLogo: b2bResponse.docs[i]['compLogo'] ?? 'N/A'),
      );
    }
  }
}
