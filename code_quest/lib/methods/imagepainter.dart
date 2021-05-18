import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class ImagePagePainter extends StatefulWidget {
  @override
  _ImagePagePainterState createState() => _ImagePagePainterState();
}

class _ImagePagePainterState extends State<ImagePagePainter> {
  ui.Image image;
  @override

  void initState(){
    super.initState();

    loadImage('assets/images/star4.jpg');
  }

  Future loadImage(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);

    setState(() {
      this.image = image;
    });
  }

  @override 
  Widget build(BuildContext context) => Scaffold(
    body: Center(
       child: image == null
       ?CircularProgressIndicator()
       :Container(
         height: 300,
         width: 300,
         child: CustomPaint(
           painter: ImageEditor(image: image),)
       )
    )
  );
}

class ImageEditor extends CustomPainter {


  ImageEditor({
    this.image,
  });

  ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    
    canvas.drawImage(image, new Offset(0.0, 0.0), new Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}