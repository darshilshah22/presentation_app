import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presentation_app/data/lesson_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoScreen extends StatefulWidget {
  final YoutubeVideo? youtubeVideo;
  const YoutubeVideoScreen({super.key, this.youtubeVideo});

  @override
  State<YoutubeVideoScreen> createState() => _YoutubeVideoScreenState();
}

class _YoutubeVideoScreenState extends State<YoutubeVideoScreen> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    log(widget.youtubeVideo!.toJson().toString());
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.youtubeVideo!.videoUrl!)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Theme.of(context).primaryColor,
        thumbnail: CachedNetworkImage(
          imageUrl: widget.youtubeVideo!.thumbnail!,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      builder: (context, player) => Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: player,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.youtubeVideo!.name!,
            style: const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
