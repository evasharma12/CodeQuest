import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './Pages/home.dart';
import './Pages/create.dart';
import 'Pages/Profile.dart';
import './Pages/doubts.dart';
import './Pages/ask.dart';
import './Pages/videos.dart';
import './Pages/dashboard.dart';
import './screens/start.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        
        primarySwatch: Colors.grey,
        backgroundColor: Colors.grey[900],
        accentColor: Colors.cyan[400],
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.cyan[400],
          textTheme: ButtonTextTheme.primary,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(20),
          // ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot){
          if(snapshot.hasData){
            return Home();
          }
          return Start();
        },
      ),
      routes: {
        '/dashboard': (context) => Dashboard(),
        '/ask': (context) => Ask(),
        '/videos': (context) => Videos(),
        '/home': (context) => Home(),
        '/create': (context) => Create(),
        '/profile': (context) => Profile(),
        '/doubts': (context)=> Doubts(),
        '/start': (context) => Start(),
      },
    );
  }
}
