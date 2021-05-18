import 'package:flutter/material.dart';
import '../Pages/popquestion.dart';
import '../methods/linepainters.dart';
import 'package:url_launcher/url_launcher.dart';

class Answer extends StatefulWidget {

  
  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  _launchURL() async {
  const url = 'https://pastebin.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.grey[900],
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.cyan[500],
                  ),
                  padding: EdgeInsets.fromLTRB(10, 2, 0, 10),
                  onPressed: (){
                    Navigator.pop(context, PopQuestion);
                  },
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(40, 20, 40, 30),
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                    ),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5000,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.cyan[500], width: 1)),
                          labelText: 'Answer Question'),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Text('Paste your code here: ', style: TextStyle(color: Colors.white),),
                  IconButton(icon: Icon(Icons.auto_awesome_motion,
                  color: Colors.cyan[500]),
                  
                  onPressed: _launchURL,)
                ],),
                Container(
                  child: Center(
                    child: RaisedButton(
                      color: Colors.cyan[500],
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      onPressed: (() {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/doubts', (route) => false);
                      }),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(foregroundPainter: LinePainter1(),)
                ),
                Container(
                  
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(foregroundPainter: LinePainter2(),)
                ),
                Container(
                  
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(foregroundPainter: LinePainter3(),)
                ),
                Container(
                  
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(foregroundPainter: LinePainter4(),)
                ),
                Container(
                  
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(foregroundPainter: LinePainter5(),)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
