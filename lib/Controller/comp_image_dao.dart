import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

String? url;
class CompImageDao{
   static Future<void> uploadImage(
      {required String fileName, required String folderName, required XFile companyImage}) async {
    log("Add image to fireBase");
    await FirebaseStorage.instance.ref().child("$folderName/$fileName").putFile(
          File(companyImage.path),
        );
  }

  static Future<String?> downloadImageUrl({required String fileName, required String folderName}) async {
    log("Get Url to firebase");
    url = await FirebaseStorage.instance.ref().child("$folderName/$fileName").getDownloadURL();
    log("uploaded Url: $url");
    return url;
  }
}