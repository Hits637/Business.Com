import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void showCustomSnackbar(
      {required String title, required String message}) {
    Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(
    //       message,
    //       style: const TextStyle(
    //         color: Colors.black,
    //         fontSize: 20,
    //       ),
    //     ),
    //     backgroundColor: const Color.fromRGBO(170, 196, 243, 1),
    //   ),
  }
}
