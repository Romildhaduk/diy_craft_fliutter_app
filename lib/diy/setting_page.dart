import 'package:diyapp/untils/models/model_class_setting_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

import 'main_home_screen.dart';

class setting_ui extends StatefulWidget {
  const setting_ui({Key? key}) : super(key: key);

  @override
  State<setting_ui> createState() => _setting_uiState();
}

class _setting_uiState extends State<setting_ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  Padding(
          padding: const EdgeInsets.only(left: 19),
          child: GestureDetector(
            onTap: (){},
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Setting",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              ...five.map(
                (e) =>
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "${e.image}",
                            height: 23,
                            width: 23,
                          ),
                          const SizedBox(
                            width: 25.0,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Text("${e.name}",
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const Icon(
                                  Icons.navigate_next,
                                  size: 25,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(height: 30,thickness: 1,),
                    ],
                  ),
              ).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
