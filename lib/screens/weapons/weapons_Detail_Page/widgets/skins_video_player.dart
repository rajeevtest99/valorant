import 'package:flutter/material.dart';
import 'package:valorant/utils/size_config.dart';
import 'package:valorant/utils/styling.dart';
import 'package:video_player/video_player.dart';

class SkinsVideoPlayer extends StatefulWidget {
  const SkinsVideoPlayer({Key? key, required this.videourl}) : super(key: key);
  final String? videourl;

  @override
  _SkinsVideoPlayerState createState() => _SkinsVideoPlayerState();
}

class _SkinsVideoPlayerState extends State<SkinsVideoPlayer> {
  VideoPlayerController? _playerController;

  @override
  void initState() {
    super.initState();

    _playerController = VideoPlayerController.network(widget.videourl!)
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((value) => _playerController!.pause());
  }

  @override
  void dispose() {
    _playerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _playerController!.value.isPlaying
          ? _playerController!.pause()
          : _playerController!.play(),
      child: Stack(
        children: [
          Center(
            child: Container(
              child: AspectRatio(
                  aspectRatio: _playerController!.value.aspectRatio,
                  child: VideoPlayer(_playerController!)),
            ),
          ),
          _playerController!.value.isPlaying
              ? Container()
              : Positioned.fill(
                  top: 2 * SizeConfig.heightMultiplier,
                  left: 2 * SizeConfig.widthMultiplier,
                  child: Center(
                      child: Icon(
                    Icons.play_arrow,
                    color: AppTheme.white,
                    size: 10 * SizeConfig.heightMultiplier,
                  )),
                )
        ],
      ),
    );
  }
}
