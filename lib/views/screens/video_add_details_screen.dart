import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotlight/views/widgets/text_inputfield.dart';
import 'package:video_player/video_player.dart';
import 'package:spotlight/controllers/upload_video_controller.dart';

class VideoDetailScreen extends StatefulWidget {
  final File videoFile;

  final String videoPath;

  VideoDetailScreen(
      {Key? key, required this.videoFile, required this.videoPath})
      : super(key: key);

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  late VideoPlayerController controller;
  TextEditingController _songController = TextEditingController();
  TextEditingController _captionController = TextEditingController();
  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              child: VideoPlayer(controller),
            ),
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          color: Colors.red,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width - 20,
                          child: TextInputField(
                            controller: _songController,
                            label: 'Song Name',
                            icon: Icons.music_note,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          color: Colors.red,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width - 20,
                          child: TextInputField(
                            controller: _captionController,
                            label: 'Caption',
                            icon: Icons.closed_caption,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        ElevatedButton(
                            onPressed: () => uploadVideoController.uploadVideo(
                                _songController.text,
                                _captionController.text,
                                widget.videoPath),
                            child: const Text(
                              'Share!',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ))
                      ])),
            )
          ],
        ),
      ),
    );
  }
}
