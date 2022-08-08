// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../untils/models/homw2_class_list.dart';
import 'google_sheet_provider.dart';
import 'house_entry.dart';

class VideoScreen extends StatefulWidget {

  final GoogleSheetsProvider? provider;
  final String id;
  final String? name;
  final String? youtubename;

  const VideoScreen({Key? key,
    required this.id, this.provider, this.name ,this.youtubename,
  }) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;

  var videoId;
  Future<List<HouseEntry>>? get houses => widget.provider?.getHouses();

  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.id)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        // autoPlay: false,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,


        // controlsVisibleAtStart: false,
        // hideControls: true,

        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var name;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              onEnded: (event) {
                // Get.back();
              },
              onReady: () {
                _controller.play();
                setState(() {});
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   widget.name!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                  children: [
                    Image.asset("asset/png/youtube2.png",height: 25,width: 25,),
                    const SizedBox(width: 10,),
                    Text(widget.youtubename!),
                  ],
                  ),
                  // Row(
                  //   children:  [
                  //     Image.asset("asset/png/youtube2.png",height: 25,width: 25,),
                  //     const SizedBox(width: 10,),
                  //     const Text("Youtube"),
                  //   ],
                  // ),
                ],
              ),
            ),
            SizedBox(height: 16,),
            const Divider(height: 2,thickness: 1,endIndent: 0,indent: 0,),
            // const SizedBox(height: 21,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  // shrinkWrap: true,
                  children: [
                    ...six1.map((e) => Padding(
                      padding:  EdgeInsets.only(top:six1.indexOf(e)==0? 20.0:0.0),
                      child: Column(children: [
                        // const SizedBox(height: 21,),
                        Row(
                          children: [
                            Container(
                              height: 78,
                              width: 114,
                              decoration: BoxDecoration(
                                image:  DecorationImage(
                                    image: AssetImage("${e.image}"),
                                    fit: BoxFit.cover),
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                "${e.name}",
                                style: const TextStyle(fontSize: 16),
                                maxLines: 2,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 30,thickness: 1,),
                      ],
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
