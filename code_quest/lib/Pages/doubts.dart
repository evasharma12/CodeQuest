import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Pages/popquestion.dart';
import '../methods/questions.dart';
import 'package:particles_flutter/particles_flutter.dart';

class Doubts extends StatefulWidget {
  @override
  _DoubtsState createState() => _DoubtsState();
}

class _DoubtsState extends State<Doubts> {
  final List<Questions> _questions = [
    Questions(
        date: DateTime.now(),
        name: 'Xyz',
        domain: 'Web D',
        question: 'Question 1?'),
    Questions(
        date: DateTime.now(),
        name: 'Xyz',
        domain: 'App D',
        question: 'Question 2?'),
    Questions(
        date: DateTime.now(),
        name: 'Xyz',
        domain: 'AI',
        question: 'Question 3?'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      //
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.cyan[500]),
        foregroundColor: Colors.cyan[500],
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text(
          'Ask your Doubts',
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.cyan[400],),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50),
        color: Colors.grey[800],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(
          () {
            Navigator.pushNamed(context, '/ask');
          },
        ),
        backgroundColor: Colors.cyan[500],
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CircularParticleScreen(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Dev',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.cyan[500],
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.cyan[500],
                    ),
                    primary: Colors.grey[900],
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'AI',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.cyan[500],
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.cyan[500],
                    ),
                    primary: Colors.grey[900],
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'ML',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.cyan[500],
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.cyan[500],
                    ),
                    primary: Colors.grey[900],
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Cloud',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.cyan[500],
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.cyan[500],
                    ),
                    primary: Colors.grey[900],
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
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
              indent: 10,
              endIndent: 10,
              color: Colors.cyan[500],
              height: 0,
              thickness: 2,
            ),
            Container(
              height: 600,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      Card(
                        color: Colors.grey[800].withOpacity(.8),
                        elevation: 2,
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                ScaleRoute(
                                  page: PopQuestion(_questions, index),
                                ),
                              );
                              print('worked');
                            },
                            leading: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date: ${_questions[index].date}",
                                    style: TextStyle(
                                      letterSpacing: 2,
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "Domain: ${_questions[index].domain}",
                                    style: TextStyle(
                                      letterSpacing: 2,
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "Asked By: ${_questions[index].name}",
                                    style: TextStyle(
                                      letterSpacing: 2,
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    child: Text(
                                      "Question: ${_questions[index].question}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        letterSpacing: 2,
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Divider(
                                  //   indent: 10,
                                  //   endIndent: 10,
                                  //   color: Colors.cyan[500],
                                  //   height: 0,
                                  //   thickness: 2,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: _questions.length,
              ),
            ),
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
        width: 500,
        child: Center(
          child: CircularParticle(
            awayRadius: 80,
            numberOfParticles: 50,
            speedOfParticles: 1,
            height: screenHeight,
            width: screenWidth,
            onTapAnimation: true,
            particleColor: Colors.white.withAlpha(150),
            awayAnimationDuration: Duration(milliseconds: 600),
            maxParticleSize: 5,
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
