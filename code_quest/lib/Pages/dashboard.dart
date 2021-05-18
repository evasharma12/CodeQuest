import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Colors.grey[900],
          title: Text('Dashboard',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  
                  accountName: Text(
                    'Evanna',
                    style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 15),
                  ),
                  accountEmail: Text('20bcs043@nith.ac.in'),
                  decoration: BoxDecoration(color: Colors.cyan[300]),
                  ),
                  ListTile(
                    title: Text('Ask your doubts', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20)),
                    leading: Icon(Icons.question_answer),
                    tileColor: Colors.blueGrey[100],
                    onTap: ((){
                      Navigator.pushNamed(context, '/doubts');
                    }),
                  ),
                  ListTile(
                    title: Text('Video Tutorials', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20)),
                    leading: Icon(Icons.question_answer),
                    tileColor: Colors.blueGrey[100],
                    onTap: ((){
                      Navigator.pushNamed(context, '/videos');
                    }),
                  ),
            ],
          ),
        ),
        body: Column(children: <Widget>[
          SizedBox(height: 25),
          Text('Recent Activity :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.cyan[300]),
          textAlign: TextAlign.left,),
          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.cyan[300]
              ),
            ),
            child: Card(child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
               Text('Date: 23/04/21', style: TextStyle(color: Colors.white, ),),
               Text('Domain : Web development',style: TextStyle(color: Colors.white,),),
               SizedBox(height: 10),
               Text('Question : What is web development?', style: TextStyle(fontSize: 18, color: Colors.white))
             ],
            ),
            color: Colors.blueGrey[800],
            ),
          ),
          SizedBox(height: 25),
           Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.cyan[300]
              ),
            ),
            child: Card(child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
               Text('Date: 22/04/21', style: TextStyle(color: Colors.white, ),),
               Text('Domain : App development',style: TextStyle(color: Colors.white,),),
               SizedBox(height: 10),
               Text('Video Link: ', style: TextStyle(fontSize: 18, color: Colors.white))
             ],
            ),
            color: Colors.blueGrey[800],
            ),
          ),
          SizedBox(height: 25),
           Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.cyan[300]
              ),
            ),
            child: Card(child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
               Text('Date: 20/04/21', style: TextStyle(color: Colors.white, ),),
               Text('Domain : Web development',style: TextStyle(color: Colors.white,),),
               SizedBox(height: 10),
               Text('Question : Why web development?', style: TextStyle(fontSize: 18, color: Colors.white))
             ],
            ),
            color: Colors.blueGrey[800],
            ),
          )
        ],));
  }
}
