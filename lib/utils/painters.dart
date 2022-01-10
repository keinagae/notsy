import 'package:flutter/cupertino.dart';

class NotchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xffff8b65)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    var path = Path()..moveTo(0, 0);
    path.quadraticBezierTo(8, size.height * .25, 0, size.height - 10);
    path.quadraticBezierTo(0, size.height, 10, size.height);
    path.quadraticBezierTo(
        size.width * .75, size.height - 8, size.width, size.height);
    path.lineTo(size.width, 10);
    path.quadraticBezierTo(size.width, 4, size.width - 15, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}