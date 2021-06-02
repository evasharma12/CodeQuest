import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videos extends StatefulWidget {
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  TextEditingController _addItemController = TextEditingController();
  bool showItem = false;

  final appBar = AppBar(
    brightness: Brightness.dark,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.tealAccent,
    ),
    foregroundColor: Colors.tealAccent,
    backgroundColor: Colors.grey[900],
    centerTitle: true,
    title: Text(
      "Video Tutoials",
      textAlign: TextAlign.right,
      style: TextStyle(
        color: Colors.tealAccent,
        fontFamily: 'Title',
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.tealAccent,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/create');
        },
      ),
      body: Column(
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: RawScrollbar(
                thumbColor: Colors.grey[600],
                child: Container(
                  height: MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('videos/')
                        .snapshots(),
                    builder: (context, videoSnapshot) {
                      if (videoSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        itemCount: videoSnapshot.data.docs.length,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: YoutubePlayerBuilder(
                                builder: (context, player) {
                                  return player;
                                },
                                player: YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId:
                                        YoutubePlayer.convertUrlToId(
                                      videoSnapshot.data.docs[index]['url'],
                                    ),
                                    flags: YoutubePlayerFlags(
                                      forceHD: true,
                                      isLive: false,
                                      startAt: 0,
                                      controlsVisibleAtStart: true,
                                      autoPlay: false,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.tealAccent,
                                  progressColors: ProgressBarColors(
                                      playedColor: Colors.tealAccent,
                                      handleColor: Colors.tealAccent),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                videoSnapshot.data.docs[index]['title'],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.tealAccent,
                                  fontFamily: 'Title'
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                videoSnapshot.data.docs[index]['name'],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: 'Content',
                                ),
                              ),
                            ),
                            Divider(
                              indent: 5,
                              endIndent: 5,
                              color: Colors.tealAccent,
                              thickness: 2,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
