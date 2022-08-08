import 'dart:developer';


import 'package:diyapp/diy/library.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../google_sheet_data/google_sheet_provider.dart';
import '../google_sheet_data/house_entry.dart';
import '../google_sheet_data/video_page.dart';

class Homepge extends StatefulWidget {
  final GoogleSheetsProvider provider;

  const Homepge({required this.provider, Key? key}) : super(key: key);

  @override
  State<Homepge> createState() => _HomepgeState();
}

class _HomepgeState extends State<Homepge> {

  Future<List<HouseEntrySecond>> get ddData => widget.provider.getHousesSecond();
  Future<List<HouseEntrythird>> get thirdData => widget.provider.getHousesthird();
  Future<List<HouseEntryforth>> get forthData => widget.provider.getHousesforth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Trending today",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 16,
                ),


                // todo : first scroll bar
                SizedBox(
                  height: 160,
                  child:  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: FutureBuilder<List<HouseEntryforth>>(
                        future: forthData,
                        builder: (context, snapshot){
                          if(snapshot.hasData){
                            final forthData = snapshot.data!;
                            log("xyz===>${forthData.runtimeType}");
                            log("xyz===>${forthData.length}");
                            return Row(
                              children: forthData.map(
                                    (e) => InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VideoScreen(
                                          id: forthData[forthData.indexOf(e)].videoUrl,
                                          name: forthData[forthData.indexOf(e)].name,
                                        ),
                                      ),
                                    );
                                    // Get.to(() => library_page(provider: widget.provider,),arguments: ddData.indexOf(e)+1);
                                  },
                                  child: Container(
                                   //padding: const EdgeInsets.only(top: 70, left: 2),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20, bottom: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            forthData[forthData.indexOf(e)].name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                           forthData[forthData.indexOf(e)].adress,
                                            style: const TextStyle(
                                                color: Color(0xff9CA3AF), fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    margin: const EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage("https://img.youtube.com/vi/${YoutubePlayer.convertUrlToId(e.videoUrl)}/maxresdefault.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    width: 274,
                                  ),
                                  ),
                              ).toList(),
                            );
                          }
                          else{
                            return const Center(child: CircularProgressIndicator());
                          }
                        }),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),



                //todo : second scroll bar
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: FutureBuilder<List<HouseEntrySecond>>(
                    future: ddData,
                      builder: (context, snapshot){
                    if(snapshot.hasData){
                      final ddData = snapshot.data!;

                      return Row(
                        children: ddData.map(
                              (e) => GestureDetector(
                            onTap: (){
                              Get.to(() => library_page(provider: widget.provider,),arguments: ddData.indexOf(e)+1);
                            },
                            child: Container(
                              width: 95,
                              margin: const EdgeInsets.only(right: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    // margin: const EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(ddData[ddData.indexOf(e)].image),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    height: 95.0,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                   ddData[ddData.indexOf(e)].name,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ).toList(),
                      );
                    }
                    else{
                      return const CircularProgressIndicator();
                    }
                  }),
                ),

                const SizedBox(
                  height: 26,
                ),

                //todo : third scroll bar
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: FutureBuilder<List<HouseEntrythird>>(
                    future: thirdData,
                      builder: (context, snapshot) {
                      if(snapshot.hasData){
                       var thirdData = snapshot.data!;
                       return Row(
                         children: thirdData.map(
                             (e) => Container(
                           width: 151,
                           margin: const EdgeInsets.only(right: 20.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               GestureDetector(
                                 onTap: (){
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                       builder: (context) => VideoScreen(
                                         id: thirdData[thirdData.indexOf(e)].videoUrl,
                                         name: thirdData[thirdData.indexOf(e)].name,
                                       ),
                                     ),
                                   );
                                 },
                                 child: Container(
                                   // margin: const EdgeInsets.only(right: 20),
                                   decoration: BoxDecoration(
                                     image: DecorationImage(
                                       image: NetworkImage("https://img.youtube.com/vi/${YoutubePlayer.convertUrlToId(e.videoUrl)}/sddefault.jpg"),
                                       fit: BoxFit.cover,
                                     ),
                                     borderRadius: BorderRadius.circular(24),
                                   ),
                                   height: 207.0,
                                 ),
                               ),
                               const SizedBox(
                                 height: 13,
                               ),
                               Text(
                                thirdData[thirdData.indexOf(e)].name.toString(),
                                 textAlign: TextAlign.start,
                                 maxLines: 1,
                                 style: const TextStyle(fontSize: 14),
                               ),
                             ],
                           ),
                         ),
                       ).toList(),
                       );
                      }
                      else{
                        return const Center(
                            child: CircularProgressIndicator());
                      }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


