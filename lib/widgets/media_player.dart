import 'package:flutter/material.dart';
import 'package:nasa/models/apod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MediaPlayer extends StatelessWidget {
  const MediaPlayer({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller =
        YoutubePlayerController(initialVideoId: url);
    return YoutubePlayer(controller: _controller);
  }
}
