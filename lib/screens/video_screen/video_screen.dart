import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../video_player/src/center_play_button.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key, required this.asset}) : super(key: key);

  final String asset;

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  bool _isShow = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.asset)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              children: [
                Container(
                    color: Colors.red, child: VideoPlayer(_controller)),
                Container(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onDoubleTap: () async {
                                final beginning =
                                    Duration.zero.inMilliseconds;
                                final skip = (_controller.value.position -
                                    const Duration(seconds: 15))
                                    .inMilliseconds;
                                setState(() {
                                  _controller.seekTo(Duration(
                                      milliseconds:
                                      math.max(skip, beginning)));
                                });
                              },
                              child: Container(color: Colors.transparent),
                            ),
                          ),
                          Expanded(child: _buildHitArea()),
                          Expanded(
                            child: GestureDetector(
                              onDoubleTap: () {
                                final end = _controller
                                    .value.duration.inMilliseconds;
                                final skip = (_controller.value.position +
                                    const Duration(seconds: 15))
                                    .inMilliseconds;
                                _controller.seekTo(Duration(
                                    milliseconds: math.min(skip, end)));
                                print(_controller.value);
                              },
                              child: Container(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
              : Container(),
        ));
  }

  Widget _buildHitArea() {
    final bool isFinished =
        _controller.value.position >= _controller.value.duration;
    final bool showPlayButton = _isShow;

    return GestureDetector(
      onTap: _playPause,
      child: CenterPlayButton(
        backgroundColor: Colors.black54,
        iconColor: Colors.white,
        isFinished: isFinished,
        isPlaying: _controller.value.isPlaying,
        show: showPlayButton,
        onPressed: _playPause,
      ),
    );
  }

  Future<void> _playPause() async {
    final isFinished = _controller.value.position >= _controller.value.duration;

    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isShow = true;
      } else {
        if (!_controller.value.isInitialized) {
          _controller.initialize().then((_) {
            _isShow = true;
            _controller.play();
          });
        } else {
          if (isFinished) {
            _controller.seekTo(Duration.zero);
          }
          _isShow = true;
          _controller.play();
        }
      }
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      _isShow = false;
    });
    // Timer? timer;
    // timer = Timer.periodic(Duration(seconds: 3), (timer) {
    //   print(_isShow);
    //   setState(() {
    //     _isShow = false;
    //   });
    // });
    // timer.cancel();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
