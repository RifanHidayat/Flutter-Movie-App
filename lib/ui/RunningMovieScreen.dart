import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RunningMovieScreen extends StatefulWidget {
  final String url;
  final String judul;

  RunningMovieScreen({this.url, this.judul});

  @override
  _RunningMovieScreenState createState() => _RunningMovieScreenState();
}

class _RunningMovieScreenState extends State<RunningMovieScreen> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.url,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Text("${widget.judul}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () {},
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
