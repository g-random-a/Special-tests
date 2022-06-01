import "package:flutter/material.dart";

class AppClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;
    Path path = Path();
    path.lineTo(0, h);

    path.quadraticBezierTo(w * 0.25, h - (h * .6), w * 0.5, h - (h * .3));
    // path.quadraticBezierTo(w * 0.25, h - (h * .6), w * 0.75, h);
    path.quadraticBezierTo(w * 0.75, h, w, h - (h * 0.15));

    // path.lineTo(w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
