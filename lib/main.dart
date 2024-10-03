import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    //INICIAR VIDEOS DA REDE
    // _controller = VideoPlayerController.networkUrl(Uri.parse(
    //     "https://videos.pexels.com/video-files/3195394/3195394-uhd_2560_1440_25fps.mp4"))..initialize().then((_){
    //   setState(() {
    //     _controller.play();
    //   });
    // });

    //INICIAR VIDEOS DO PROJETO
    _controller = VideoPlayerController.asset("assets/videos/coelho.mp4")
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {
          // _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Text("Pressione o play"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow
        ),
          onPressed: (){
            setState(() {
              _controller.value.isPlaying ? _controller.pause() : _controller.play() ;
            });
          }
      ),
    );
  }
}
