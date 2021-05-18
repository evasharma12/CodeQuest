import 'package:flutter/material.dart';

import '../methods/circlepainters.dart';
import 'auth_screen.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Image(
                      image: AssetImage('assets/images/laptop.png'),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Welcome to  ',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Code Quest',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.cyan[500],
                                fontWeight: FontWeight.bold,
                              ))
                        ]),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Tap below to continue to the',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    'Code Quest ',
                    style: TextStyle(
                        color: Colors.cyan[500],
                        fontSize: 17,
                        fontStyle: FontStyle.italic),
                  ),
                  
                  Text(
                    'and let the learning begin!',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 150,
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AuthScreen()));
                      }
                      ,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Text(
                          'Get Started ...',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      color: Colors.cyan[500],
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(height: 20),
                  //google sign in button
                  
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 400,
                    child: CustomPaint(
                      foregroundPainter: CirclePainter3(),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 600,
                    child: CustomPaint(
                      foregroundPainter: CirclePainter1(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
