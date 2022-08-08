import 'package:diyapp/diy/main_home_screen.dart';
import 'package:diyapp/google_sheet_data/google_sheet_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'diy/continue_Page.dart';
import 'diy/logo_page.dart';

int ?initScreen;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt("initScreen");
  await preferences.setInt("initScreen", 1);
  runApp(
      GetMaterialApp(
        theme: ThemeData(fontFamily:"Poppins Regular"),
        debugShowCheckedModeBanner: false,
       initialRoute: initScreen == 0 || initScreen == null ? "onboard" : "home" ,
      home: const SpleshScreen(),


       // home: const SpleshScreen(),
    ),
  );
}


