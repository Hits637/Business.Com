import "package:business_dot_com/view/Dashboard/CompDetails/DetailsofCompanyUI.dart";
import "package:flutter/material.dart";

class MorePageUI extends StatefulWidget {
  final int? majorListIndex;
  final int? index;
  const MorePageUI({super.key, required this.majorListIndex, required this.index});

  @override
  State<MorePageUI> createState() =>
      _MorePageUIState(majorListIndex: majorListIndex);
}

class _MorePageUIState extends State<MorePageUI> {
  int? majorListIndex;

  _MorePageUIState({required this.majorListIndex});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(208, 194, 219, 241).withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 8,
              offset: const Offset(0, -4),
            ),
          ],
          color: Colors.white,
        ),
        child: DetailsOfCompanyUI(
          majorListIndex: majorListIndex!,
          index: widget.index!,
        ),
      ),
    );
  }
}
