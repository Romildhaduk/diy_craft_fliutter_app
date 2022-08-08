import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../google_sheet_data/google_sheet_provider.dart';
import '../google_sheet_data/house_entry.dart';
import '../google_sheet_data/video_page.dart';
import '../untils/models/homw2_class_list.dart';

class home2_page extends StatefulWidget {
  final GoogleSheetsProvider provider;

  const home2_page({Key? key, required this.provider}) : super(key: key);

  @override
  State<home2_page> createState() => _home2_pageState();
}

class _home2_pageState extends State<home2_page> {
  Future<List<HouseEntry>> get houses => widget.provider.getHouses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Image.asset(
                "asset/png/upfile.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                    SizedBox(
                    height: 12,
                  ),
                  SizedBox(height: 18,),
                ],
              ),
            ),
            const Divider(height: 1,thickness: 1,endIndent: 0,indent: 0,),
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
                      ],),
                    ),),
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
