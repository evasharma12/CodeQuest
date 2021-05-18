import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Pages/writeanswer.dart';
import '../methods/questions.dart';

class PopQuestion extends StatefulWidget {
  List<Questions> _questions;
  var index;

  PopQuestion(this._questions, this.index);

  @override
  _PopQuestionState createState() => _PopQuestionState();
}

class _PopQuestionState extends State<PopQuestion> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          
          color: Colors.grey[900],
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.cyan[500],
                    onPressed: () {
                      Navigator.pop(context, '/doubts');
                    },
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 180,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(40, 10, 40, 20),
                    decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black,
                        //     blurRadius: 10.0,
                        //     spreadRadius: 2.0,
                        //     offset: Offset(
                        //       5.0,
                        //       5.0,
                        //     ),
                        // )
                        // ],
                        // ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget._questions.map((questions) {
                          return Text(
                            '\n${widget._questions[widget.index].question}',
                            style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: RaisedButton(
                        color: Colors.cyan[500],
                        child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Answer',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: (() {
                          Navigator.push(context, SlideRightRoute(page: Answer()));
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
