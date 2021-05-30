import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:chat_app/screens/start.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var user = FirebaseAuth.instance.currentUser;
  var username, email, photoUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        toolbarHeight: 60,
        brightness: Brightness.dark,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.cyan[500]),
        foregroundColor: Colors.cyan[500],
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text(
          "Profile",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.cyan[400],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 50,
        ),
        child: Column(
          children: [
            CircularParticleScreen(),
            CircleAvatar(
              radius: 78,
              backgroundColor: Colors.cyan,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                radius: 75,
              ),
            ),
            Divider(
              height: 50,
              thickness: 2,
              color: Colors.cyan[400],
            ),
            Row(
              children: [
                Text(
                  "NAME:  ",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [StreamBuilder(
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
                                  color: Colors.cyan[400],
                                  letterSpacing: 3,
                                  fontSize: 18,
                                ),
                              )
                          ],
                        );
                      }),],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "CURRENT LEAGUE:  ",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Champion",
                  style: TextStyle(
                    color: Colors.cyan[400],
                    letterSpacing: 3,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.email_rounded,
                  color: Colors.grey,
                ),
                Text(
                  ":",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      "${user.email}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.cyan[400],
                        letterSpacing: 3,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 50,
              thickness: 2,
              color: Colors.cyan[400],
            ),
            RaisedButton(
                color: Colors.cyan[400],
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Start(),
                      ),
                      (route) => false);
                })
          ],
        ),
      ),
    );
  }
}

class CircularParticleScreen extends StatelessWidget {
  const CircularParticleScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: 0,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: CircularParticle(
            awayRadius: 100,
            numberOfParticles: 40,
            speedOfParticles: 1,
            height: screenHeight,
            width: screenWidth,
            onTapAnimation: true,
            particleColor: Colors.white.withAlpha(150),
            awayAnimationDuration: Duration(milliseconds: 600),
            maxParticleSize: 3,
            isRandSize: true,
            isRandomColor: true,
            randColorList: [
              Colors.white.withAlpha(210),
              Colors.white.withAlpha(210),
              Colors.black.withAlpha(210),
              Colors.cyan[500].withAlpha(210)
            ],
            awayAnimationCurve: Curves.easeInOutBack,
            enableHover: true,
            hoverColor: Colors.white,
            hoverRadius: 90,

            connectDots: false, //not recommended
          ),
        ),
      ),
    );
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRoute({this.page})
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
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}
