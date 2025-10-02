import 'package:flutter/material.dart';

class HomeClipperWidget extends CustomClipper<Path> { 
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    // First wave (shallower)
    path.quadraticBezierTo(
      size.width * 0.070, size.height - 5, // lifted up
      size.width * 0.1, size.height - 10,
    );

    // Second wave (shallower)
    path.quadraticBezierTo(
      size.width * 0.375, size.height - 40, // lifted up
      size.width * 0.5, size.height-18,
    );

    // Third wave (normal)
    path.quadraticBezierTo(
      size.width * 0.625, size.height,
      size.width * 0.75, size.height - 30,
    );

    // Fourth wave (normal)
    path.quadraticBezierTo(
      size.width * 0.875, size.height - 50,
      size.width, size.height - 20,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}


class HomeClipperWidget2 extends CustomClipper<Path> { 
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    // First wave (shallower)
    path.quadraticBezierTo(
      size.width * 0.070, size.height - 5, // lifted up
      size.width * 0.1, size.height - 10,
    );

    // Second wave (shallower)
    path.quadraticBezierTo(
      size.width * 0.376, size.height - 50, // lifted up
      size.width * 0.52 , size.height-25,
    );

    // Third wave (normal)
    path.quadraticBezierTo(
      size.width * 0.6+15, size.height-15,
      size.width * 0.72, size.height - 35,
    );

    // Fourth wave (normal)
    path.quadraticBezierTo(
      size.width * 0.85, size.height - 70,
      size.width, size.height - 20,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}