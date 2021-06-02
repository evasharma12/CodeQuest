import 'package:flutter/cupertino.dart';
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
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: Image(
                    image: AssetImage('assets/images/laptop.png'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Title'),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Code Quest',
                        style: TextStyle(
                            fontSize: 36,
                            color: Colors.tealAccent,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Header'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Tap below to continue to the',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Content',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Code Quest',
                  style: TextStyle(
                    color: Colors.tealAccent,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Header',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'and let the learning begin!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Content',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.tealAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                      child: Text(
                        'Get Started...',
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 16,
                          fontFamily: 'Title',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
