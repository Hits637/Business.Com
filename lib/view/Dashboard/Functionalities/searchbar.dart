import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Business.com",
          style: GoogleFonts.inter(
              fontSize: 28, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(32, 103, 234, 1),
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(width: 1.5)),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search here",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    //color: Colors.blue,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 0.5),
                        color: Colors.blue),
                    child: const Icon(Icons.search_rounded),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            // Recent Search Header
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Searches",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "See all",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
