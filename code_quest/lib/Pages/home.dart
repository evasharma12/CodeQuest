import '../methods/circlepainters.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var user = FirebaseAuth.instance.currentUser;
  var username, email, photoUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.grey[850],
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        toolbarHeight: 60,
        brightness: Brightness.dark,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.cyan[500]),
        foregroundColor: Colors.cyan[500],
        backgroundColor: Colors.grey[900],
        shadowColor: Colors.grey[800],
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.cyan[400]),
          textAlign: TextAlign.center,
        ),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[900],
        ),
        child: Drawer(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.grey[900]),
                      accountName: Text(
                        '${user.displayName}',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: Colors.cyan[400]),
                      ),
                      accountEmail: Text(
                        '${user.email}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                      margin: EdgeInsets.all(0),
                    ),
                    Divider(
                      thickness: 4,
                      color: Colors.cyan[500],
                      height: 0,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      tileColor: Colors.grey[900],
                      leading: CircleAvatar(
                        radius: 20,
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.question_answer_outlined,
                            color: Colors.cyan[500],
                            size: 20,
                          ),
                        ),
                        backgroundColor: Colors.grey[900],
                      ),
                      title: Text(
                        "Ask your doubts",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/doubts');
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      tileColor: Colors.grey[900],
                      leading: CircleAvatar(
                        radius: 20,
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.video_library_outlined,
                            color: Colors.cyan[500],
                            size: 20,
                          ),
                        ),
                        backgroundColor: Colors.grey[900],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/videos');
                      },
                      title: Text(
                        "Video tutorials",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      tileColor: Colors.grey[900],
                      leading: CircleAvatar(
                        radius: 20,
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.settings,
                            color: Colors.cyan[500],
                            size: 20,
                          ),
                        ),
                        backgroundColor: Colors.grey[900],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      title: Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height - 70,
          //   child: Icon(Icons.star_border,
          //   color: Colors.grey[300],
          //   ),
          // ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 30, 40, 20),
            height: 200,
            width: 500,
            child: Column(
              children: [
                Text(
                  '\n\n\"Any fool can write code that a computer can understand. Good programmers write code that humans can understand.\"',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  '\n-Martin Fowler',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                      color: Colors.cyan[500]),
                )
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 400,
            child: CustomPaint(
              foregroundPainter: CirclePainter3(),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 400,
            child: CustomPaint(
              foregroundPainter: CirclePainter1(),
            ),
          )
        ]),
      ),
    );
  }
}
