import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ask extends StatefulWidget {
  @override
  _AskState createState() => _AskState();
}

class _AskState extends State<Ask> {
  var answer_name = 0;

  final _nameController = TextEditingController();
  final _domainController = TextEditingController();
  final _questionController = TextEditingController();

  void _submitData() {
    final enteredName = _nameController.text;
    final enteredDomain = _domainController.text;
    final enteredQuestion = _questionController.text;

    if (enteredName.isEmpty ||
        enteredQuestion.isEmpty ||
        enteredDomain.isEmpty) {
      return;
    }
  }

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
          "Add Question",
          style: TextStyle(
            color: Colors.cyan[400],
          ),
          textAlign: TextAlign.right,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[500],
        child: Text(
          'Ask',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
        ),
        onPressed: (() {
          if (_nameController.text.isEmpty ||
              _domainController.text.isEmpty ||
              _questionController.text.isEmpty) {
            return;
          } else {
            FirebaseFirestore.instance
                .collection('questions/NdlPlLZdFfX1Rv1aflFQ/doubts')
                .add({
              "name": "${_nameController.text}",
              "domain": "${_domainController.text}",
              "question": "${_questionController.text}"
            }).then((value) {
              // FirebaseFirestore.instance
              //     .collection('questions').doc('NdlPlLZdFfX1Rv1aflFQ').collection('answers')
                  
              //     .doc()
              //     .set({'answer': 'No answers yet',
              //     'id': value.id}, SetOptions(merge: true));
            });
            
            answer_name++;
            Navigator.pop(context, '/doubts');
          }
        }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Card(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.cyan[300], width: 1),
                      ),
                      hintText: 'Who are you?',
                      labelText: 'Name'),
                  controller: _nameController,
                  onSubmitted: (_) => _submitData(),
                ),
              ),
              Card(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.cyan[300], width: 1),
                      ),
                      hintText: 'Which field is abusing you?',
                      labelText: 'Domain',
                      fillColor: Colors.white),
                  controller: _domainController,
                  onSubmitted: (_) => _submitData(),
                ),
              ),
              SizedBox(height: 5),
              Card(
                child: SingleChildScrollView(
                  child: Container(
                    height: 400,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 1000,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.cyan[300], width: 1),
                        ),
                        hintText: 'Spill it out',
                        labelText: 'Question',
                      ),
                      controller: _questionController,
                      onSubmitted: (_) => _submitData(),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Paste your code here: ',
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    icon: Icon(Icons.auto_awesome_motion,
                        color: Colors.cyan[500]),
                    onPressed: _launchURL,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
