// import 'package:b2b/b2b/form1.dart';
// import 'package:flutter/material.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';

// class B2b extends StatefulWidget {
//   final String? email;
//   const B2b({
//     super.key,
//     this.email,
//   });

//   @override
//   State<B2b> createState() => _B2bState();
// }

// class _B2bState extends State<B2b> {
//   // List to keep track of expansion state for each item
//   List<bool> _isExpandedList = List.filled(5, false);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             // LinearGradient
//             gradient: LinearGradient(
//               // colors for gradient
//               colors: [
//                 Color.fromARGB(255, 0, 45, 81),
//                 Color.fromARGB(255, 0, 144, 247),
//               ],
//             ),
//           ),
//         ),
//         title: const Text(
//           "B2B",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       body: ListView.builder(
//         itemCount: 5,
//         itemBuilder: (context, index) => Column(
//           children: [
//             const SizedBox(height: 10),
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               height: _isExpandedList[index] ? 400 : 200, // Dynamic height
//               width: MediaQuery.of(context).size.width - 20,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(width: 1, color: Colors.blue),
//                 color: Colors.white,
//                 boxShadow: const [
//                   BoxShadow(offset: Offset(5, 6), color: Colors.grey),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Container(
//                               height: 100,
//                               width: 120,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: Image.asset(
//                                   "assets/images/b2b.jpg",
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const Text(
//                             "Location",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w600, fontSize: 16),
//                           )
//                         ],
//                       ),
//                       Expanded(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 GradientText(
//                                   "Ruchika Ensono",
//                                   style: const TextStyle(
//                                       fontSize: 18.0,
//                                       fontWeight: FontWeight.bold),
//                                   colors: const [
//                                     Color.fromARGB(255, 0, 45, 81),
//                                     Color.fromARGB(255, 0, 144, 247),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 5),
//                                 const Text(
//                                   "Requirement:",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 16),
//                                 ),
//                                 const Text(
//                                     "We need employees for packaging hjgsiudgc dnbcuhids hbdcushiocs vsdjhgi",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 14)),
//                                 const Text(
//                                   "Domain:",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 16),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                       onPressed: () {
//                         setState(
//                           () {
//                             _isExpandedList[index] = !_isExpandedList[index];
//                           },
//                         );
//                       },
//                       child: GradientText(
//                         _isExpandedList[index] ? "Read Less" : "Read More",
//                         textAlign: TextAlign.end,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                         colors: const [
//                           Color.fromARGB(255, 0, 45, 81),
//                           Color.fromARGB(255, 0, 144, 247),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // splashColor: Color.fromARGB(255, 0, 45, 81),
//         focusColor: Color.fromARGB(255, 0, 45, 81),

//         onPressed: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) {
//                 return RegistrationForm();
//               },
//             ),
//           );
//         },
//         backgroundColor: Colors.white,
//         child: const Icon(
//           Icons.add,
//           size: 45,
//           color: Colors.blue,
//         ),
//       ),
//     );
//   }
// }

import 'package:business_dot_com/model/b2b_model.dart';
import 'package:business_dot_com/view/Dashboard/Functionalities/B2B/b2b_form1.dart';
import 'package:business_dot_com/view/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Business_Registration/form1.dart';

class B2b extends StatefulWidget {
  //const B2b({super.key});
  final String? email;
  const B2b({
    super.key,
    this.email,
  });

  @override
  State<B2b> createState() => _B2bState();
}

class _B2bState extends State<B2b> {
  late List<bool> _isExpandedList;

  @override
  void initState() {
    super.initState();
    _isExpandedList = List.filled(b2bDetailList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 45, 81),
                Color.fromARGB(255, 0, 144, 247),
              ],
            ),
          ),
        ),
        title: const Text(
          "B2B",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: b2bDetailList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: 10),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.blue),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(offset: Offset(5, 6), color: Colors.grey),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 100,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    b2bDetailList[index].compLogo,
                                    fit: BoxFit.fill,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.error, size: 50),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                b2bDetailList[index].city,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                GradientText(
                                  b2bDetailList[index].organizationName,
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                  colors: const [
                                    Color.fromARGB(255, 0, 45, 81),
                                    Color.fromARGB(255, 0, 144, 247),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  "Requirement:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Text(
                                  b2bDetailList[index].businessColab,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                  maxLines: _isExpandedList[index] ? null : 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  "Domain:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Text(
                                  b2bDetailList[index].domain,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                if (_isExpandedList[index]) ...[
                                  const SizedBox(height: 5),
                                  const Text(
                                    "Owner Name:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    b2bDetailList[index].ownerName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "Established Year:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "Employees Count:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    b2bDetailList[index].employeerequire,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isExpandedList[index] = !_isExpandedList[index];
                            });
                          },
                          child: GradientText(
                            _isExpandedList[index] ? "Read Less" : "Read More",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            colors: const [
                              Color.fromARGB(255, 0, 45, 81),
                              Color.fromARGB(255, 0, 144, 247),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                            // colors for gradient
                            colors: [
                              Color.fromARGB(255, 0, 45, 81),
                              Color.fromARGB(255, 0, 144, 247),
                            ],
                          ),
                        ),
                        child: const Text(
                          "Connect And Collab",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // splashColor: Color.fromARGB(255, 0, 45, 81),
        focusColor: const Color.fromARGB(255, 0, 45, 81),

        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const B2bRegistrationForm();
              },
            ),
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          size: 45,
          color: Colors.blue,
        ),
      ),
    );
  }
}
