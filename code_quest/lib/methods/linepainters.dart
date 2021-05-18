import 'package:flutter/material.dart';

class LinePainter1 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.deepOrange;
    paint.strokeWidth = 5;
    paint.strokeCap = StrokeCap.round;
  canvas.drawLine(
    Offset(size.width*1/8, size.height /2),
    Offset(size.width/2, size.height /2),
    paint,
  );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class LinePainter2 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.cyan[500];
    paint.strokeWidth = 5;
    paint.strokeCap = StrokeCap.round;
  canvas.drawLine(
    Offset(size.width*1/2, size.height /4),
    Offset(size.width*5/6, size.height /4),
    paint,
  );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class LinePainter3 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.amber;
    paint.strokeWidth = 5;
    paint.strokeCap = StrokeCap.round;
  canvas.drawLine(
    Offset(size.width*1/3, size.height /6),
    Offset(size.width*3/4, size.height /6),
    paint,
  );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class LinePainter4 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 5;
    paint.strokeCap = StrokeCap.round;
  
  canvas.drawLine(
    Offset(size.width*1/10, size.height /6),
    Offset(size.width/3, size.height /6),
    paint,
  );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class LinePainter5 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.cyan[500];
    paint.strokeWidth = 5;
    paint.strokeCap = StrokeCap.round;
  
  canvas.drawLine(
    Offset(size.width*1/2, size.height /2),
    Offset(size.width/4, size.height /2),
    paint,
  );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}