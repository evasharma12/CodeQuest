import 'package:flutter/material.dart';
import '../methods/linepainters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  var name = '';
  var title = '';
  var url = '';

  void _pressed() {
    FocusScope.of(context).unfocus();
    if (name.isNotEmpty && title.isNotEmpty && url.isNotEmpty) {
      FirebaseFirestore.instance.collection('videos').add(
        {
          'name': name,
          'title': title,
          'url': url,
        },
      );
      setState(() {
        Navigator.pop(context);
      });
    }
    else {
      setState(() {
        Navigator.pop(context);
      });
    }
  }

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
          style: TextStyle(
            color: Colors.cyan[400],
          ),
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
        onPressed: _pressed,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Card(
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: ' Your Name',
                    labelStyle: TextStyle(
                      color: Colors.grey[900],
                      letterSpacing: 2,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        name = value.trim();
                      },
                    );
                  },
                ),
              ),
              Card(
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: ' Title of your video',
                    labelStyle: TextStyle(
                      color: Colors.grey[900],
                      letterSpacing: 2,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        title = value.trim();
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 5),
              Card(
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: ' URL of your video',
                    labelStyle: TextStyle(
                      color: Colors.grey[900],
                      letterSpacing: 2,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        url = value.trim();
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(
                    foregroundPainter: LinePainter1(),
                  )),
              Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(
                    foregroundPainter: LinePainter2(),
                  )),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(
                    foregroundPainter: LinePainter3(),
                  )),
              Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(
                    foregroundPainter: LinePainter4(),
                  )),
              Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(
                    foregroundPainter: LinePainter5(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
