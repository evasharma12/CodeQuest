import 'package:flutter/material.dart';
import '../Pages/popquestion.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Doubts extends StatefulWidget {
  @override
  _DoubtsState createState() => _DoubtsState();
}

class _DoubtsState extends State<Doubts> {
  final appBar = AppBar(
    brightness: Brightness.dark,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.tealAccent),
    foregroundColor: Colors.tealAccent,
    backgroundColor: Colors.grey[900],
    centerTitle: true,
    title: Text(
      'Ask your Doubts',
      textAlign: TextAlign.right,
      style: TextStyle(
        color: Colors.tealAccent,
        fontFamily: 'Title',
      ),
    ),
  );

  final ScrollController _controllerOne = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: appBar,
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
        backgroundColor: Colors.tealAccent,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: RawScrollbar(
          isAlwaysShown: true,
          controller: _controllerOne,
          thumbColor: Colors.grey[300],
          child: Container(
            height: MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top -
                70,
            child: SingleChildScrollView(
              child: RawScrollbar(
          //       isAlwaysShown: true,
          // controller: _controllerOne,
          thumbColor: Colors.grey[600],
                              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CircularParticleScreen(),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.tealAccent,
                      height: 0,
                      thickness: 2,
                    ),
                    Container(
                      height: 600,
                      child: StreamBuilder(
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
                            return ListView.builder(
                                itemCount: documents.length,
                                itemBuilder: (ctx, index) {
                                  return Column(
                                    children: [
                                      SizedBox(height: 20),
                                      Container(
                                        color: Colors.grey[800].withOpacity(.8),
                                        margin:
                                            EdgeInsets.fromLTRB(15, 0, 15, 0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: ListTile(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                ScaleRoute(
                                                  page: PopQuestion(index,
                                                      documents[index].id),
                                                ),
                                              );
                                            },
                                            leading: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Asked by: ${documents[index]['name']}",
                                                    style: TextStyle(
                                                      letterSpacing: 2,
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontFamily: 'Content',
                                                    ),
                                                  ),
                                                  SizedBox(height: 3),
                                                  Text(
                                                    "Domain: ${documents[index]['domain']}",
                                                    style: TextStyle(
                                                      letterSpacing: 2,
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontFamily: 'Title',
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Container(
                                                    child: Text(
                                                      "Question: ${documents[index]['question']}",
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                        letterSpacing: 2,
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontFamily: 'Title',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
              Colors.tealAccent.withAlpha(210)
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
