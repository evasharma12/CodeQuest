import 'package:flutter/material.dart';
class CirclePainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 4/5, size.height * 1 / 500);
    final paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.white
      ..style = PaintingStyle.stroke;
      
    canvas.drawCircle(
      center,
      size.width * 1 / 3,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


class CirclePainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 1 / 4, size.height * 5 / 6);
    final paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.cyan[500]
      ..style= PaintingStyle.stroke;
      
    canvas.drawCircle(
      center,
      size.width * 1 / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
