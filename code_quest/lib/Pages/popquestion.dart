import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Pages/writeanswer.dart';

class PopQuestion extends StatefulWidget {
  var index, id;

  PopQuestion(this.index, this.id);

  @override
  _PopQuestionState createState() => _PopQuestionState();
}

class _PopQuestionState extends State<PopQuestion> {
  var index = 0;

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
                        children: <Widget>[
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection(
                                    'questions/NdlPlLZdFfX1Rv1aflFQ/doubts')
                                .snapshots(),
                            builder: (ctx, streamSnapshot) {
                              if (streamSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final documents = streamSnapshot.data.docs;
                              return SafeArea(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 20, 20, 0),
                                    child: Text('Question: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 10, 20, 20),
                                    child: Text(
                                        '${documents[widget.index]['question']}'),
                                  ),
                                ],
                              ));
                            },
                          ),
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection(
                                      'questions/NdlPlLZdFfX1Rv1aflFQ/answers').where("id", isEqualTo: widget.id)
                                  .snapshots(),
                              builder: (ctx, streamSnapshot) {
                                if (streamSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                final documents = streamSnapshot.data.docs;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(20,10,10,10),
                                    child: Text(
                                      'Answers: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  for (var i = 0; i < documents.length; i++)
                                    
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                                      child: Text(documents[i]['answer']),
                                    )

                                  
                                  
                                ]);
                              }),
                        ],
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
                              'Add Answer',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: (() {
                          Navigator.push(context,
                              SlideRightRoute(page: Answer(widget.id)));
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
