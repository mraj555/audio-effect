import 'dart:math' as math;

import 'package:audio_effect/audio_effect.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioEffects extends StatefulWidget {
  final double? width;
  final double? height;
  final double? artworkWidth;
  final double? artworkHeight;
  final Color? color;
  final BorderRadius? artworkBorder;
  final int id;
  final ArtworkType type;
  final String url;
  final bool isPlaying;
  final bool? isLocal;
  final EdgeInsetsGeometry? padding;

  const AudioEffects({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.padding,
    this.artworkWidth,
    this.artworkHeight,
    this.artworkBorder,
    this.isLocal,
    required this.isPlaying,
    required this.url,
    required this.id,
    required this.type,
  }) : super(key: key);

  @override
  State<AudioEffects> createState() => _AudioEffectsState();
}

class _AudioEffectsState extends State<AudioEffects>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 30),
  );

  AudioPlayer audioPlayer = AudioPlayer();

  void getAudio() async {
    if (widget.isPlaying) {
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(
          () {
            _controller.stop();
          },
        );
      }
    } else {
      var res = await audioPlayer.play(widget.url, isLocal: widget.isLocal);
      if (res == 1) {
        _controller.repeat();
      }
    }
  }

  @override
  void initState() {
    getAudio();
    audioPlayer.play(widget.url);
    _controller.repeat();
    super.initState();

    audioPlayer.onPlayerCompletion.listen(
      (event) {
        setState(
          () {
            _controller.reset();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: widget.width,
        height: widget.height,
        padding: widget.padding,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://photos.google.com/search/_tra_/photo/AF1QipPAQgGNI6pGFRwC0DkJ-YgLrblrbN6BIdAmNBe0'),
          ),
        ),
        child: QueryArtworkWidget(
          id: widget.id,
          type: widget.type,
          keepOldArtwork: true,
          artworkWidth: widget.artworkWidth,
          artworkHeight: widget.artworkHeight,
          nullArtworkWidget: Container(),
          artworkBorder: widget.artworkBorder,
        ),
      ),
    );
  }
}
