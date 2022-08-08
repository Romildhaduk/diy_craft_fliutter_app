import 'package:diyapp/google_sheet_data/house_entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../google_sheet_data/google_sheet_provider.dart';
import '../google_sheet_data/video_page.dart';
import 'library.dart';

class Discover_page extends StatefulWidget {
  final GoogleSheetsProvider provider;

  const Discover_page({
    required this.provider,
    Key? key,
  }) : super(key: key);

  @override
  State<Discover_page> createState() => _Discover_pageState();
}

class _Discover_pageState extends State<Discover_page> {
  Future<List<HouseEntyfive>?> get fiveData => widget.provider.getHousesfive();
  Future<List<HouseEntry>> get houses => widget.provider.getHouses();
  Future<List<HouseEntrySecond>> get ddData => widget.provider.getHousesSecond();



  var _controller = TextEditingController();

  late String search;
  List<HouseEntrySecond> dataList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(8),
                      topRight: const Radius.circular(8),
                      bottomLeft: dataList.isNotEmpty? const Radius.circular(0):
                       const Radius.circular(8),
                    ),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  height: 50,
                  child: TextFormField(
                    controller: _controller,
                    onChanged: (val) async {
                      if (val.isEmpty) {
                        dataList.clear();
                        setState(() {});
                      }
                      else {
                        dataList = await ddData;
                        dataList = dataList
                            .where((element) => element.name
                                .toLowerCase()
                                .startsWith(val.toLowerCase()))
                            .toList();
                        print("object length ==> ${dataList.length}");
                        setState(() {});
                      }
                    },
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.only(top: 15),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "asset/svg/Search.svg",
                          height: 19,
                          width: 18,
                          color: Colors.black,
                        ),
                      ),
                      suffixIcon: 
                      IconButton(
                        onPressed: () {
                          setState(() {
                            dataList.clear();
                            _controller.clear();
                          });
                          print(dataList.length);
                        },
                        icon: const Icon(Icons.clear),
                      ),
                      border: const OutlineInputBorder(),
                      hintText: "Artist Song or Album",
                      hintStyle:
                          const TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(bottomLeft: const Radius.circular(8),bottomRight:  const Radius.circular(8),),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child: Column(
                        children: [
                          if (dataList != null)
                            ...dataList
                                .map(
                                  (e) => GestureDetector(
                                    onTap: () {
                                      Get.to(
                                          () => library_page(
                                                provider: widget.provider,
                                              ),
                                          arguments: dataList.indexOf(e) + 1);dataList.clear();
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // Container(
                                        //   decoration: BoxDecoration(
                                        //     image: DecorationImage(
                                        //       image: NetworkImage(e.image),
                                        //       fit: BoxFit.cover,
                                        //     ),
                                        //     borderRadius: BorderRadius.circular(8),
                                        //   ),
                                        //   height: 95.0,
                                        // ),
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.03,
                                          width: MediaQuery.of(context).size.width,

                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Text(
                                              e.name,
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        //Divider(thickness: 0.1,color: Colors.black,height: 1,),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: Get.height * 0.075,
                      width: Get.width * 0.424,
                      decoration: BoxDecoration(
                        color: const Color(0xff2CBE9D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Top",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "TRENDING",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: Get.height * 0.075,
                      width: Get.width * 0.424,
                      decoration: BoxDecoration(
                        color: const Color(0xffFAB933),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Top",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "TRENDING",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: const [
                    Text(
                      "Browse All",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.navigate_next_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                FutureBuilder<List<HouseEntrySecond>>(
                  future: ddData,
                    builder: (context, snapshot){
                  if(snapshot.hasData){
                  var  ddData = snapshot.data!;
                  return Column(
                    children: [
                      Container(
                        height:  Get.height * 0.15,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          image:  const DecorationImage(
                            image: AssetImage("asset/png/schoolcreat.png"),
                            fit: BoxFit.cover,
                            colorFilter:
                            ColorFilter.mode(Colors.black38, BlendMode.darken),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        child:  const Center(
                          child: Text(
                            "ddssd",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  );
                  }
                  else{
                    return const CircularProgressIndicator();
                  }
                }),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Get.width * 0.424,
                          height: Get.height * 0.11,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("asset/png/pearl.png"),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black38, BlendMode.darken),
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          child: const Center(
                            child: Text(
                              "Pearl",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          width: Get.width * 0.424,
                          height: Get.height * 0.11,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("asset/png/wood.png"),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black38, BlendMode.darken),
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          child: const Center(
                            child: Text(
                              "wood",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Get.width * 0.424,
                          height: Get.height * 0.11,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("asset/png/athome.png"),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black38, BlendMode.darken),
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          child: const Center(
                            child: Text(
                              "At Home",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          width: Get.width * 0.424,
                          height: Get.height * 0.11,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("asset/png/folk1.png"),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black38, BlendMode.darken),
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          child: const Center(
                            child: Text(
                              "Folk",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: const [
                        Text(
                          "New Release Top 10",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.navigate_next_outlined,
                          color: Colors.black,
                          size: 24,
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    FutureBuilder<List<HouseEntry>>(
                        future: houses,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var houses = snapshot.data!;
                            return Column(
                              children: houses.reversed.map(
                                    (e) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder:(context) => VideoScreen(
                                              id: houses[houses.indexOf(e)].videoUrl,
                                              name: houses[houses.indexOf(e)].name,
                                            ),
                                          ),
                                        );
                                      },
                                      child:
                                      // (houses.indexOf(e) >= 0 && houses.indexOf(e) <= 9 )
                                      ( houses.indexOf(e) <= 66 &&  houses.indexOf(e) >=54 )
                                          ? Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        height: 60,
                                        color: Colors.white,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 56,
                                              width: 56,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://img.youtube.com/vi/${YoutubePlayer.convertUrlToId(e.videoUrl)}/0.jpg"),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    houses[houses.indexOf(e)].name,
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                          ],
                                        ),
                                     // IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),),
                                      ) : Container(),
                                    ),
                                  )
                                  .toList(),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// Widget build(BuildContext context) {
//   return Scaffold(
//     // This is handled by the search bar itself.
//     resizeToAvoidBottomInset: false,
//     body: Stack(
//       fit: StackFit.expand,
//       children: [
//         buildMap(),
//         buildBottomNavigationBar(),
//         buildFloatingSearchBar(),
//       ],
//     ),
//   );
// }
//
// Widget buildFloatingSearchBar() {
//   final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
//
//   return FloatingSearchBar(
//     hint: 'Search...',
//     scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
//     transitionDuration: const Duration(milliseconds: 800),
//     transitionCurve: Curves.easeInOut,
//     physics: const BouncingScrollPhysics(),
//     axisAlignment: isPortrait ? 0.0 : -1.0,
//     openAxisAlignment: 0.0,
//     width: isPortrait ? 600 : 500,
//     debounceDelay: const Duration(milliseconds: 500),
//     onQueryChanged: (query) {
//       // Call your model, bloc, controller here.
//     },
//     // Specify a custom transition to be used for
//     // animating between opened and closed stated.
//     transition: CircularFloatingSearchBarTransition(),
//     actions: [
//       FloatingSearchBarAction(
//         showIfOpened: false,
//         child: CircularButton(
//           icon: const Icon(Icons.place),
//           onPressed: () {},
//         ),
//       ),
//       FloatingSearchBarAction.searchToClear(
//         showIfClosed: false,
//       ),
//     ],
//     builder: (context, transition) {
//       return ClipRRect(
//         borderRadius: BorderRadius.circular(8),
//         child: Material(
//           color: Colors.white,
//           elevation: 4.0,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: Colors.accents.map((color) {
//               return Container(height: 112, color: color);
//             }).toList(),
//           ),
//         ),
//       );
//     },
//   );
// }
