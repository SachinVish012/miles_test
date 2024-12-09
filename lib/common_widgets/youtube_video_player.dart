import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:test_media/core/extension/size_extension.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayerPrams {
  final String videoId;
  final String title;
  final String thumbnailImage;
  const YoutubeVideoPlayerPrams(
      {required this.videoId,
      required this.thumbnailImage,
      required this.title});
}

class YoutubeVideoPlayer extends StatefulWidget {
  final YoutubeVideoPlayerPrams? prams;

  const YoutubeVideoPlayer({super.key, this.prams});

  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  late YoutubePlayerController _controller;
  bool _thumbnailReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.prams!.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(_listener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(
        NetworkImage(widget.prams!.thumbnailImage),
        context,
        onError: (exception, stackTrace) {
          debugPrint("Error preloading image: $exception");
        },
      ).then((_) {
        setState(() {
          _thumbnailReady = true;
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  void _listener() {
    if (_controller.value.playerState == PlayerState.ended) {
      _controller.seekTo(const Duration(seconds: 0));
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: ()async {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
              ]);
              context.pop();
            },
          ),
          title: Text(widget.prams?.title ?? ""),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.heightMultiplier),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: _thumbnailReady
                ? YoutubePlayer(
                    controller: _controller,
                    thumbnail: Image.network(
                      widget.prams!.thumbnailImage,
                      fit: BoxFit.fill,
                    ),
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                    onEnded: (metaData) {
                      _controller.seekTo(const Duration(seconds: 0));
                      _controller.play();
                    },
                  )
                : Container(
                    color: Colors.black,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
