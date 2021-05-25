import '../methods/circlepainters.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var user = FirebaseAuth.instance.currentUser;
  var email, photoUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.grey[850],
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        toolbarHeight: 60,
        brightness: Brightness.dark,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.tealAccent),
        foregroundColor: Colors.tealAccent,
        backgroundColor: Colors.grey[900],
        shadowColor: Colors.grey[800],
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.tealAccent,
            fontFamily: 'Title',
            letterSpacing: 2,
          ),
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
                      accountName: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .where("email", isEqualTo: user.email)
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                for (var i = 0; i < documents.length; i++)
                                  Text(
                                    documents[i]['username'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontSize: 30,
                                      fontFamily: 'Header',
                                    ),
                                  )
                              ],
                            );
                          }),
                      accountEmail: Text(
                        '${user.email}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 2,
                          color: Colors.white,
                          fontFamily: 'Title',
                        ),
                      ),
                      margin: EdgeInsets.all(0),
                    ),
                    Divider(
                      thickness: 4,
                      color: Colors.tealAccent,
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
                            color: Colors.tealAccent,
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
                          fontFamily: 'Title',
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
                            color: Colors.tealAccent,
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
                          fontFamily: 'Title',
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
                            color: Colors.tealAccent,
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
                          fontFamily: 'Title',
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
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Content',
                    fontSize: 15,
                  ),
                ),
                Text(
                  '\n-Martin Fowler',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                    color: Colors.tealAccent,
                    fontFamily: 'Title',
                  ),
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
