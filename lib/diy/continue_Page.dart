import 'package:diyapp/diy/main_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../google_sheet_data/google_sheet.dart';
import '../google_sheet_data/google_sheet_provider.dart';
import 'discover_page.dart';

class Continuepage extends StatefulWidget {
  const Continuepage({Key? key}) : super(key: key);

  @override
  State<Continuepage> createState() => _ContinuepageState();
}

class _ContinuepageState extends State<Continuepage> {
  final provider = GoogleSheetsProvider(credentials);


  @override
  void initState()  {
   getdata();
  }

  void getdata()async{
    await provider.initializeForWorksheet(spreadsheetId, "User");
  }

  /// Initialize provider
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 10,),
            SvgPicture.asset("asset/svg/Frame.svg",height: 300,),
               const Text.rich(
                 TextSpan(
                   text: "Great",style: TextStyle(fontSize: 35),
                   children: <InlineSpan>[
                    TextSpan(
                      text: " Crafts",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                      children: <InlineSpan>[
                        TextSpan(
                          text: "\n ideas",
                          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                          children: <InlineSpan>[
                        TextSpan(
                          text: " at your \n finger tips",
                          style: TextStyle(fontSize: 35,fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                 ],
              ),
                 ],
               ),
                 textAlign: TextAlign.center,
               ),
            TextButton(
              onPressed: (){
                Get.to(()=> MainHomePage(provider: provider,));
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff2CBE9D),
                ),
                height: 60,
                width: 210,
                child: const Text("Continue",style: TextStyle(color: Colors.white,fontSize: 16),),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("By continuing you acceptour Terms of use & Privacy policy",textAlign: TextAlign.center,maxLines: 2,),
            )
          ],
        ),
      ),
    );
  }
}
