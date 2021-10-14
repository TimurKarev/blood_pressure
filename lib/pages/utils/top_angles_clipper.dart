import 'package:flutter/cupertino.dart';

class TopAnglesClipper extends CustomClipper<Path> {
  final double radius;

  TopAnglesClipper({required this.radius});
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width-radius, 0) // p2
      ..arcToPoint(Offset(size.width, radius), radius: Radius.circular(radius)) //p3
      ..lineTo(size.width, size.height) //p4
      ..lineTo(0, size.height)
      ..lineTo(0, 0 + radius)
      ..arcToPoint(Offset(radius, 0), radius: Radius.circular(radius))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
