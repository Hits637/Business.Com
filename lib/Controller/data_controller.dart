import 'dart:developer';

import 'package:business_dot_com/model/b2b_model.dart';
import 'package:business_dot_com/model/comp_detail_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

//final DataController controller = Get.put(DataController());
Set<String> domainSet = {};

List<List<CompDetailModel>> majorCompDetailModelList =
    List.generate(domainSet.length, (_) => []);

List domainList = domainSet.toList();
List<CompDetailModel> userCompList = [];

class DataController extends GetxController {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  void onInit() async {
    super.onInit();
    await fetchCompData();
    fetchB2BData();
    //fetchUserData(userId);
  }

  static Future<void> fetchCompData() async {
    await Future.delayed(Duration(milliseconds: 200));
    domainList.clear();
    domainSet.clear();
    majorCompDetailModelList = List.generate(domainSet.length, (_) => []);

    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("CompanyDetails").get();
    log("Resoponse: ${response.docs}");

    log("Total user documents: ${response.docs.length}");

    Map<String, int> domainIndexMap = {};
    log("in fetch comp data");
    for (int i = 0; i < domainList.length; i++) {
      domainIndexMap[domainList[i]] = i;
    }

    for (var doc in response.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      // Loop through comp1, comp2, etc.
      data.forEach((key, value) {
        if (value is Map<String, dynamic>) {
          String? domain = value['Domain'];
          if (domain == null || domain.isEmpty) {
            log("Missing domain in $key, skipping...");
            return;
          }

          int? domainIndex = domainIndexMap[domain];
          if (domainIndex == null) {
            domainSet.add(domain);
            domainList.add(domain);
            domainIndex = domainList.length - 1;
            majorCompDetailModelList.add([]);
            domainIndexMap[domain] = domainIndex;
          }

          majorCompDetailModelList[domainIndex].add(
            CompDetailModel(
              organizationName: value['OrganizationName'] ?? 'N/A',
              city: value['city'] ?? 'N/A',
              pitchTextEditingController: value['pitch'] ?? 'N/A',
              revenue: value['Revenue'] ?? 'N/A',
              compLogo: value['CompLogo'] ?? 'N/A',
              ownerName: value['OwnerName'] ?? 'N/A',
              domain: value['Domain'] ?? 'N/A',
              organizationType: value['Organization Type'] ?? 'N/A',
              establishmentYear: value['Establishment Year'] ?? 'N/A',
              gstinNo: value['GSTIN No'] ?? 'N/A',
              address: value['Address'] ?? 'N/A',
              state: value['state'] ?? 'N/A',
              descriptionTextEditingController: value['Description'] ?? 'N/A',
              partnerSkills: value['Skills'] ?? 'N/A',
              websiteTextEditingController: value['Website'] ?? 'N/A',
              partnerMinQualification: value['Min Qualification'] ?? 'N/A',
              partnerRequirment: value['Requirement'] ?? 'N/A',
              partnerStakes: value['stake'],
              investmentRange: value['investmentRange'] ?? "N/A",
              mobileNo: value['mobileNo'] ?? 'N/A',
            ),
          );
        }
      });
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

  static Future<void> fetchUserData(String userId) async {
    userCompList.clear();
    log("in FethcUserData");
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection("CompanyDetails")
        .doc(userId)
        .get();
    if (docSnapshot.exists) {
      Map<String, dynamic> userData =
          docSnapshot.data() as Map<String, dynamic>;
      final compKeys = userData.keys
          .where((key) => key.startsWith("comp"))
          .toList()
        ..sort((a, b) => int.parse(a.replaceFirst("comp", ""))
            .compareTo(int.parse(b.replaceFirst("comp", ""))));

      for (String key in compKeys) {
        final value = userData[key];
        userCompList.add(
          CompDetailModel(
            organizationName: value['OrganizationName'] ?? 'N/A',
            city: value['city'] ?? 'N/A',
            pitchTextEditingController: value['pitch'] ?? 'N/A',
            revenue: value['Revenue'] ?? 'N/A',
            compLogo: value['CompLogo'] ?? 'N/A',
            ownerName: value['OwnerName'] ?? 'N/A',
            domain: value['Domain'] ?? 'N/A',
            organizationType: value['Organization Type'] ?? 'N/A',
            establishmentYear: value['Establishment Year'] ?? 'N/A',
            gstinNo: value['GSTIN No'] ?? 'N/A',
            address: value['Address'] ?? 'N/A',
            state: value['state'] ?? 'N/A',
            descriptionTextEditingController: value['Description'] ?? 'N/A',
            partnerSkills: value['Skills'] ?? 'N/A',
            websiteTextEditingController: value['Website'] ?? 'N/A',
            partnerMinQualification: value['Min Qualification'] ?? 'N/A',
            partnerRequirment: value['Requirement'] ?? 'N/A',
            partnerStakes: value['stake'],
            investmentRange: value['investmentRange'] ?? "N/A",
            mobileNo: value['mobileNo'] ?? 'N/A',
          ),
        );
      }
      log("userCompList: $userCompList");
    }
  }
}

void saveCompanyData(Map<String, dynamic> data, String userId) async {
  DocumentReference docRef =
      FirebaseFirestore.instance.collection("CompanyDetails").doc(userId);
  DocumentSnapshot snapshot = await docRef.get();

  Map<String, dynamic> existingData = {};
  if (snapshot.exists) {
    existingData = snapshot.data() as Map<String, dynamic>;
  }
  int index = 1;

  while (existingData.containsKey("comp$index")) {
    index++;
  }
  String newKey = "comp$index";
  await docRef.set(
    {newKey: data},
    SetOptions(merge: true),
  );
}

Future<void> deleteCompanyAndShift(String userId, int compIndexToDelete) async {
  final docRef =
      FirebaseFirestore.instance.collection("CompanyDetails").doc(userId);

  DocumentSnapshot snapshot = await docRef.get();
  if (!snapshot.exists) return;

  Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

  // 1. Get all keys sorted by number
  List<String> compKeys = data.keys
      .where((key) => key.startsWith("comp"))
      .toList()
    ..sort((a, b) => int.parse(a.replaceFirst("comp", ""))
        .compareTo(int.parse(b.replaceFirst("comp", ""))));

  if (compIndexToDelete >= compKeys.length) return;

  // 2. Delete the selected key
  String keyToDelete = compKeys[compIndexToDelete];
  await docRef.update({keyToDelete: FieldValue.delete()});

  // 3. Shift all subsequent entries up
  for (int i = compIndexToDelete + 1; i < compKeys.length; i++) {
    String oldKey = compKeys[i];
    String newKey = "comp${i - 1}";

    await docRef.set({newKey: data[oldKey]}, SetOptions(merge: true));
    await docRef.update({oldKey: FieldValue.delete()});
  }

  // 4. Check if any company entries are left
  DocumentSnapshot updatedSnapshot = await docRef.get();
  Map<String, dynamic> updatedData =
      updatedSnapshot.data() as Map<String, dynamic>;
  bool hasAnyCompLeft = updatedData.keys.any((key) => key.startsWith("comp"));

  if (!hasAnyCompLeft) {
    await docRef.delete();
  }
}

Future<bool> roleCheck(String userId) async {
  log("In Role check");

  try {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("CompanyDetails")
        .doc(userId)
        .get();
    //log("Role check :true");
    if (doc.exists) {
      log("Document found");
      return true;
    } else {
      log("Document does not exist");
      return false;
    }
  } catch (e) {
    log("Error fetching userId: $e");
    return false;
  }
}
