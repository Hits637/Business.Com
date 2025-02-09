import 'package:flutter/material.dart';

class CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // Start at the left edge of the app bar
    path.lineTo(
        0,
        size.height -
            40); // Height of the curve start point (adjust for more/less curve)

    // Apply symmetric curve: quadraticBezierTo creates the curve
    path.quadraticBezierTo(
      size.width /
          2, // Control point horizontally at the center (this ensures symmetry)
      size.height +
          40, // Control point's vertical position (adjust for more/less curve)
      size.width,
      size.height -
          40, // End point, same height as the starting point for symmetry
    );

    // Close the path and draw a line back to the top-right corner of the app bar
    path.lineTo(size.width, 0); // Top right corner
    path.close(); // Close the path to complete the shape

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
