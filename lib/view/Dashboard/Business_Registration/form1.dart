//import 'package:business_dot_com/view/Dashboard/Business_Registration/widget/partner_finish_button.dart';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_year_picker/flutter_year_picker.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'package:business_dot_com/view/Dashboard/Business_Registration/widget/domain_list.dart';
import 'package:business_dot_com/view/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../Controller/comp_image_dao.dart';
import '../../widget/custom_snackbar.dart';
import 'form2.dart';
import 'widget/organization_type.dart';
import '../../../Controller/text_editing_controller.dart';

class RegistrationForm extends StatefulWidget {
  final String? email;

  const RegistrationForm({Key? key, this.email}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState(email: email);
}

class _RegistrationFormState extends State<RegistrationForm> {
  String dropdownValue = domainlist.first;
  String organizationdropdown = organizationTypelist.first;
  String? email;
  _RegistrationFormState({this.email});
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _companyImage;
  String _errorText = '';
  Future<void> _pickYear(BuildContext context) async {
    // Show year picker dialog
    final DateTime? pickedYear = await showMonthYearPicker(
      context: context,
      initialDate: DateTime.now(), // Initially selected year
      firstDate: DateTime(1900), // Earliest selectable year
      lastDate: DateTime(2100), // Latest selectable year
    );

    // If a year is selected, update the text field
    if (pickedYear != null) {
      setState(() {
        establishmentYear.text =
            "${pickedYear.month}-${pickedYear.year}"; // Display only the year
      });
    }
  }

  void _validMobileNum() {
    try {
      RegExp regExp = RegExp(r"^[7-9][0-9]{9}$");

      if (!regExp.hasMatch(mobileNo.text)) {
        throw const FormatException();
      }
      setState(() {
        _errorText = '';
      });
    } catch (e) {
      setState(() {
        _errorText = "Please enter the valid mobile number";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
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
          "Register your firm",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  _companyImage =
                      await _imagePicker.pickImage(source: ImageSource.gallery);
                  if (_companyImage != null) {
                    log("File = ${_companyImage!.path}");
                    setState(() {});
                  }
                },
                child: Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: const Color.fromARGB(255, 207, 227, 243),
                    child: (_companyImage == null)
                        ? const Center(
                            child: Icon(
                              Icons.camera_alt,
                              size: 100,
                              color: Colors.blue,
                            ),
                          )
                        : ClipOval(
                            child: Image.file(
                              File(_companyImage!.path),
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Organization Name:  ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),

              Container(
                height: 55,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 218, 229, 242)
                          .withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(5, 8),
                    )
                  ],
                ),
                child: TextField(
                  controller: organizationName,
                  decoration: InputDecoration(
                    //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                    //fillColor: const Color.fromARGB(255, 219, 229, 246),
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    //labelText: 'Enter your email',
                    hintText: 'Enter Organization Name...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    //hintText: "Enter Organization Name...",
                    prefixIcon: const Icon(Icons.business),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Owner Name: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 218, 229, 242)
                          .withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(5, 8),
                    )
                  ],
                ),
                child: TextField(
                  controller: ownerName,
                  decoration: InputDecoration(
                    //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                    //fillColor: const Color.fromARGB(255, 219, 229, 246),
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    //hintText: "Enter Owner Name...",
                    hintText: 'Enter Owner Name...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    prefixIcon: const Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Mobile Number:  ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),

              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 218, 229, 242)
                          .withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(5, 8),
                    )
                  ],
                ),
                child: TextField(
                  controller: mobileNo,
                  decoration: InputDecoration(
                    //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                    //fillColor: const Color.fromARGB(255, 219, 229, 246),
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    //labelText: 'Enter your email',
                    hintText: 'Enter Your Mobile No...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    //hintText: "Enter Organization Name...",
                    prefixIcon: const Icon(Icons.phone_android_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 10),
              if (_errorText.isNotEmpty)
                Text(
                  _errorText,
                  style: const TextStyle(color: Colors.red),
                ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Domain Name: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.blue, // Border color
                    width: 1.5, // Border width
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 218, 229, 242)
                          .withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 10, // Increased blur for a stronger effect
                      offset: const Offset(5, 8),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                  child: DropdownMenu<String>(
                    leadingIcon: const Icon(Icons.domain_add),
                    controller: domain,
                    initialSelection: domainlist.first,
                    onSelected: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    dropdownMenuEntries: domainlist
                        .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                    inputDecorationTheme: const InputDecorationTheme(
                      enabledBorder: InputBorder.none,
                    ),
                    menuStyle: const MenuStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Organization Type: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),

              Container(
                height: 55,
                width: 490,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.blue, // Border color
                    width: 1.5, // Border width
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 218, 229, 242)
                          .withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(5, 8),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                  child: DropdownMenu<String>(
                    width: 700,
                    controller: organizationType,
                    enableSearch: false,
                    initialSelection: organizationTypelist.first,
                    onSelected: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        organizationdropdown = value!;
                      });
                    },
                    inputDecorationTheme: const InputDecorationTheme(
                      enabledBorder: InputBorder.none,
                    ),
                    menuStyle: const MenuStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    dropdownMenuEntries: organizationTypelist
                        .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Establishment Year: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),

              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 218, 229, 242)
                          .withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(5, 8),
                    )
                  ],
                ),
                child: TextField(
                  controller: establishmentYear,
                  decoration: InputDecoration(
                    //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                    //fillColor: const Color.fromARGB(255, 219, 229, 246),
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    //hintText: "YYYY",
                    hintText: 'YYYY',
                    hintStyle: const TextStyle(
                        //color: Color.fromARGB(255, 190, 189, 189),

                        ),
                    suffixIcon: const Icon(Icons.calendar_month),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onTap: () async {
                    _pickYear(context);
                  },
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "GSTIN No: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 218, 229, 242)
                          .withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(5, 8),
                    )
                  ],
                ),
                child: TextField(
                  controller: gstinNo,
                  decoration: InputDecoration(
                    //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                    //fillColor: const Color.fromARGB(255, 219, 229, 246),
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    //hintText: "Enter GSTIN No. (Optional)",
                    hintText: 'Enter GSTIN No. (Optional)',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    prefixIcon: const Icon(Icons.numbers),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Revenue: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 218, 229, 242)
                            .withOpacity(1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(5, 8),
                      )
                    ]),
                child: TextField(
                  controller: revenue,
                  decoration: InputDecoration(
                    //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                    //fillColor: const Color.fromARGB(255, 219, 229, 246),
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    //hintText: "Enter Revenue...",
                    hintText: 'Enter Revenue...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    prefixIcon: const Icon(Icons.money),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "Address: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),

              Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 218, 229, 242)
                            .withOpacity(1),
                        spreadRadius: 0.5,
                        blurRadius: 5,
                        offset: const Offset(5, 8),
                      )
                    ]),
                child: TextField(
                  controller: address,
                  decoration: InputDecoration(
                    //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                    //fillColor: const Color.fromARGB(255, 219, 229, 246),
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    //hintText: "Enter Address...",
                    hintText: 'Enter Address...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    prefixIcon: const Icon(Icons.post_add),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "City: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),
              //SizedBox(height: screenHeight * 0.03),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 218, 229, 242)
                            .withOpacity(1),
                        spreadRadius: 0.5,
                        blurRadius: 5,
                        offset: const Offset(5, 8),
                      )
                    ]),
                child: TextField(
                  controller: city,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                    //fillColor: const Color.fromARGB(255, 219, 229, 246),
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    hintText: 'Enter City...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  "State: ",
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                  colors: const [
                    Color.fromARGB(255, 0, 45, 81),
                    Color.fromARGB(255, 0, 144, 247),
                  ],
                ),
              ),
              //SizedBox(height: screenHeight * 0.03),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 218, 229, 242)
                          .withOpacity(1),
                      spreadRadius: 0.5,
                      blurRadius: 5,
                      offset: const Offset(5, 8),
                    )
                  ],
                ),
                child: TextField(
                  controller: state,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    //fillColor: const Color.fromRGBO(170, 196, 243, 1),
                    //fillColor: const Color.fromARGB(255, 219, 229, 246),
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    hintText: 'Enter State...',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              //const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async {
                      _validMobileNum();
                      if (_errorText.isEmpty) {
                        if (organizationName.text.trim().isNotEmpty &&
                            ownerName.text.trim().isNotEmpty &&
                            mobileNo.text.trim().isNotEmpty &&
                            domain.text.trim().isNotEmpty &&
                            organizationType.text.trim().isNotEmpty &&
                            establishmentYear.text.trim().isNotEmpty &&
                            revenue.text.trim().isNotEmpty &&
                            address.text.trim().isNotEmpty &&
                            city.text.trim().isNotEmpty &&
                            state.text.trim().isNotEmpty) {
                          String fileName =
                              _companyImage!.name + DateTime.now().toString();

                          await CompImageDao.uploadImage(
                              fileName: fileName,
                              folderName: "Partner",
                              companyImage: _companyImage!);

                          url = await CompImageDao.downloadImageUrl(
                              fileName: fileName, folderName: "Partner");
                          _companyImage = null;

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Form2(
                                email: email,
                              ),
                            ),
                          );
                        } else {
                          CustomSnackBar.showCustomSnackbar(
                              message: "Please enter valid Data",
                              context: context);
                        }
                      } else {
                        CustomSnackBar.showCustomSnackbar(
                            message: _errorText, context: context);
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
                            color: const Color.fromARGB(255, 145, 190, 243)
                                .withOpacity(1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(5, 8),
                          )
                        ],

                        borderRadius: BorderRadius.circular(20),
                        //color: const Color.fromRGBO(32, 103, 234, 1),
                        color: Colors.blue,
                      ),
                      child: const Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
