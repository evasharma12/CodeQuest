import 'package:flutter/material.dart';
import '../methods/linepainters.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.cyan[500]),
        foregroundColor: Colors.cyan[500],
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text(
          "Create",
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.cyan[400],),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[500],
        child: Text(
          'Upload',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 12,
          ),
        ),
        onPressed: (() {
          Navigator.pop(context, '/videos');
        }),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Card(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.cyan[300],
                          width: 1,
                        ),
                      ),
                      labelText: 'Your Name',
                      fillColor: Colors.white),
                ),
              ),
              Card(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.cyan[300],
                          width: 1,
                        ),
                      ),
                      labelText: 'Title of your video'),
                ),
              ),
              SizedBox(height: 5),
              Card(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.cyan[300],
                          width: 1,
                        ),
                      ),
                      labelText: 'URL of the video',
                      fillColor: Colors.white),
                ),
              ),
              SizedBox(height: 50,),
              Container(

                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(foregroundPainter: LinePainter1(),)
              ),
              Container(

                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(foregroundPainter: LinePainter2(),)
              ),
              Container(

                  height: 50,
                  width: MediaQuery.of(context).size.width ,
                  child: CustomPaint(foregroundPainter: LinePainter3(),)
              ),
              Container(

                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(foregroundPainter: LinePainter4(),)
              ),
              Container(

                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(foregroundPainter: LinePainter5(),)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
