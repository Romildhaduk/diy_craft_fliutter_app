import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../google_sheet_data/google_sheet_provider.dart';
import '../google_sheet_data/house_entry.dart';
import '../google_sheet_data/video_page.dart';

class library_page extends StatefulWidget {
  final GoogleSheetsProvider provider;

  const library_page({required this.provider, Key? key}) : super(key: key);

  @override
  State<library_page> createState() => _library_pageState();
}

class _library_pageState extends State<library_page> {

  Future<List<HouseEntry>> get houses => widget.provider.getHouses();
  var one = Get.arguments;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: FutureBuilder<List<HouseEntry>>(
              future: houses,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  var houses = snapshot.data!;

                  // log("data ---? ${}")
                  if(one != null){
                    houses = houses.where((e) {
                      // log("data ---> ${e.address == one.toString()} === ${e.address.toString()} === $one");
                      return e.address.toString() == one.toString();
                    }).toList();

                  }
                  log("data ---> ${houses.first.number}");

                  return Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...houses.reversed.map(
                            (e) => GestureDetector(
                          onTap: () {
                            //log(one);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoScreen(
                                  id: houses[houses.indexOf(e)].videoUrl,
                                  name: houses[houses.indexOf(e)].name,
                                  youtubename: houses[houses.indexOf(e)],
                                ),
                              ),
                            );
                            //Get.to(() => const home2_page());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 18,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 176,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://img.youtube.com/vi/${YoutubePlayer.convertUrlToId(e.videoUrl)}/sddefault.jpg"),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(24),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 4,
                                        blurRadius: 6,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Text(
                                  houses[houses.indexOf(e)].name.toString().trim(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  houses[houses.indexOf(e)].videoUrl1.toString().trim()
                                ),
                                 const SizedBox(
                                  height: 15,
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                else{
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: const Center(
                        child: CircularProgressIndicator()),
                  );
                }
              }),
        ),
      ),
    );
  }
}




// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// physics: const BouncingScrollPhysics(),
// child: Row(
// children: second
//     .map(
// (e) => InkWell(
// onTap: (){
// Get.to(() => library_page(provider: widget.provider,),arguments: second.indexOf(e)+1);
// },
// child: Container(
// width: 95,
// margin: const EdgeInsets.only(right: 20.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Container(
// // margin: const EdgeInsets.only(right: 20),
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage(e.image),
// fit: BoxFit.cover,
// ),
// borderRadius: BorderRadius.circular(8),
// ),
// height: 95.0,
// ),
// const SizedBox(
// height: 10,
// ),
// Text(
// "${e.name}",
// textAlign: TextAlign.start,
// style: const TextStyle(fontSize: 12),
// )
// ],
// ),
// ),
// ),
// ).toList(),
// ),
// ),