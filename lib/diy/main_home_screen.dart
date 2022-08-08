import 'package:diyapp/diy/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../google_sheet_data/google_sheet_provider.dart';
import 'discover_page.dart';
import 'home_page.dart';
import 'library.dart';

class MainHomePage extends StatefulWidget {
  final GoogleSheetsProvider provider;
  const MainHomePage({required this.provider,
    Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int pageIndex = 0;




  @override
  Widget build(BuildContext context) {
    final pages = [
      Homepge(provider: widget.provider,),
      Discover_page(provider: widget.provider,),
      library_page(provider: widget.provider),
      const setting_ui(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 60,
        color: const Color(0xff2CBE9D),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ?  SvgPicture.asset("asset/svg/Home.svg",color: Colors.white)
                      :  SvgPicture.asset("asset/svg/Home.svg",color: Colors.white.withOpacity(0.5),),
                ),
                pageIndex == 0?
                Container(
                  height: 5,
                  width: 5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ):const SizedBox(),
              ],
            ),
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ?  SvgPicture.asset("asset/svg/Search.svg",color: Colors.white)
                      :  SvgPicture.asset("asset/svg/Search.svg",color: Colors.white.withOpacity(0.5),),
                ),
                pageIndex == 1?
                Container(
                  height: 5,
                  width: 5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ):const SizedBox(),
              ],
            ),
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: pageIndex == 2
                      ?  SvgPicture.asset("asset/svg/Vector.svg",color: Colors.white)
                      :  SvgPicture.asset("asset/svg/Vector.svg",color: Colors.white.withOpacity(0.5),),
                ),
                pageIndex == 2?
                Container(
                  height: 5,
                  width: 5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ):const SizedBox(),
              ],
            ),
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  icon: pageIndex == 3
                      ?  SvgPicture.asset("asset/svg/Profile.svg",color: Colors.white)
                      :  SvgPicture.asset("asset/svg/Profile.svg",color: Colors.white.withOpacity(0.5)),
                ),
                pageIndex == 3?
                Container(
                  height: 5,
                  width: 5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ):const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
