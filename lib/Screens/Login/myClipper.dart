import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        0, size.height / 1.15, size.width /4, size.height / 1.15);
    path.quadraticBezierTo(
        size.width - 50, size.height / 1.15, size.width, size.height / 1.3);
    // path.lineTo(size.width / 2, size.height-50);
    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height / 2);
    //path.quadraticBezierTo(size.width/2,size.height-100, size.width, size.height-200);
    // path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
