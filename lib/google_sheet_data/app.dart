import 'package:flutter/material.dart';

import 'google_sheet_home_page.dart';
import 'google_sheet_provider.dart';

// const String routeAdd = '/add';
// const String routeHome = '/';

class SheetsApp extends StatelessWidget {
  final GoogleSheetsProvider provider;

  const SheetsApp({
    required this.provider,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Houses App',
      debugShowCheckedModeBanner: false,
      // initialRoute: routeHome,
      home: HomePage(provider: provider),
      // routes: {
      //   routeHome: (_) => HomePage(provider: provider),

      // },
    );
  }
}
