import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Ask extends StatefulWidget {
  @override
  _AskState createState() => _AskState();
}

class _AskState extends State<Ask> {
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
        
        title: Text("Add Question",
         style: TextStyle(color: Colors.cyan[400],),
        textAlign: TextAlign.right,),
        
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[500],
        child: Text(
          'Ask',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
        ),
        onPressed: (() {
          Navigator.pop(context, '/doubts');
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
                      hintText: 'Which field is abusing you?',
                      labelText: 'Domain',
                      fillColor: Colors.white),
                ),
              ),
              Card(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan[300], width : 1),
                                    
                      ),
                      hintText: 'Who are you?',
                      labelText: 'Name'),
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
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text('Paste your code here: ', style: TextStyle(color: Colors.white),),
                IconButton(icon: Icon(Icons.auto_awesome_motion,
                color: Colors.cyan[500]),
                
                onPressed: _launchURL,)
              ],)
            ],
          ),
        ),
      ),
    );
    
  }
}
