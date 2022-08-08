import 'dart:developer';

import 'package:diyapp/google_sheet_data/video_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'google_sheet_provider.dart';
import 'house_entry.dart';


class HomePage extends StatefulWidget {
  final GoogleSheetsProvider provider;

  const HomePage({
    required this.provider,
    Key? key,}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<HouseEntry>> get houses => widget.provider.getHouses();
  String? _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('video Player'),
        actions: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(0.0),
              child: DropdownButton<String>(
                value: _chosenValue,
                //elevation: 5,
                style: const TextStyle(color: Colors.black),

                items: <String>[
                  'ABC',
                  'XYZ',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: const Text(
                  "Please choose a langauage",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                onChanged: (String? value) {
                  print(_chosenValue = value);
                  setState(() {
                    _chosenValue = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<HouseEntry>>(
        future: houses,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

         final houses = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: houses.length,
                    itemBuilder: (context, index) =>
                    // HouseCard(
                    //   // onVideo: () {
                    //   //   log(houses[index].videoUrl);
                    //   //   _launchUrl(Uri.parse(houses[index].videoUrl));
                    //   // },
                    //   onVideo: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => VideoScreen(
                    //           id: houses[index].videoUrl,
                    //         ),
                    //       ),
                    //     );
                    //   },
                    //   video: houses[index].videoUrl,
                    //   image: houses[index].image,
                    //   name: houses[index].name,
                    //   address: houses[index].address,
                    //   onDelete: () async {
                    //     await widget.provider.deleteHouse(index);
                    //
                    //     /// should call again the getter
                    //     setState(() {});
                    //   },
                    // ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 90,
                          width: 150,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                houses[index].number,
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                houses[index].name,textAlign: TextAlign.start,maxLines: 3,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(houses[index].address),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () async {
                                        await widget.provider
                                            .deleteHouse(index);
                                        //     /// should call again the getter
                                        setState(() {});
                                      },
                                      child: const Icon(Icons.delete)),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                VideoScreen(
                                                  id: houses[index].videoUrl,
                                                ),
                                          ),
                                        );
                                      },
                                      child: const Icon(
                                          Icons.video_camera_back_sharp)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ]          ),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await Navigator.of(context).pushNamed(routeAdd);
      //     setState(() {});
      //   },
      //   child: const Icon(
      //     Icons.house,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
//
// void choiceActions(String choice) {
//   print('Working');
// }
}

class HouseCard extends StatelessWidget {
  final String name;
  final String address;
  final String image;
  final String video;
  final Function() onVideo;
  final VoidCallback onDelete;

  const HouseCard({
    required this.name,
    required this.address,
    required this.onDelete,
    required this.onVideo,
    required this.video,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(address, textAlign: TextAlign.start),
                  // Text(
                  //   text,
                  //   textAlign: TextAlign.start,
                  //   style: const TextStyle(
                  //       fontSize: 20.0, fontWeight: FontWeight.bold),
                  // ),
                  Image.network(image.toString())
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                color: Colors.grey,
                height: 50.0,
                width: 2.0,
              ),
            ),
            Center(
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: onDelete,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.video_collection,
                      color: Colors.red,
                    ),
                    onPressed: onVideo,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
