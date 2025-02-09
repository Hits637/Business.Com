import 'package:flutter/material.dart';

class TextfieldLogin extends StatelessWidget {
  const TextfieldLogin({super.key, required this.controller,required this.labelText});
  final TextEditingController controller;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 305,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Color.fromRGBO(255, 255, 255, 1),
          filled: true,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.email_outlined),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
