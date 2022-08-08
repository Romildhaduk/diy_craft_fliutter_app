import 'dart:async';
import 'dart:async';

import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';

import 'house_entry.dart';

class GoogleSheetsProvider {
  final GSheets _gsheets;

  late Worksheet _worksheet;
  late Worksheet _worksheet1;
  late Worksheet _worksheet2;
  late Worksheet _worksheet3;
  late Worksheet _worksheet4;

  GoogleSheetsProvider(String credentials) : _gsheets = GSheets(credentials);

  Future<void> initializeForWorksheet(
      String spreadsheetId, String worksheetTitle) async {
    final excel = await _gsheets.spreadsheet(spreadsheetId);

    _worksheet = excel.worksheetByTitle("User")!;
    _worksheet1 = excel.worksheetByTitle("User2")!;
    _worksheet2 = excel.worksheetByTitle("User3")!;
    _worksheet3 = excel.worksheetByTitle("User4")!;
    _worksheet4 = excel.worksheetByTitle("User5")!;

  }

  // Todo: First sheet
  Future<List<HouseEntry>> getHouses() async {
    /// skips the first value which is the header
    final values = (await _worksheet.values.allRows()).skip(1).toList();
    // houses.sort((b, a) => a.number.toLowerCase().compareTo(b.number.toLowerCase()));
    // List<HouseEntity> dd = values.map((value) => HouseEntity.fromSheets(value)).toList();
    // dd.sort((b, a) => a.number.toLowerCase().compareTo(b.number.toLowerCase()));
    return values.map((value) => HouseEntry.fromSheets(value)).toList();
  }

  // Todo: Second sheet
  Future<List<HouseEntrySecond>> getHousesSecond() async {
    /// skips the first value which is the header
    final values = (await _worksheet1.values.allRows()).skip(1).toList();
    return values.map((value) => HouseEntrySecond.fromSheet(value)).toList();
  }

  //Todo: third sheet
  Future<List<HouseEntrythird>> getHousesthird()async{
    final values = (await _worksheet2.values.allRows()).skip(1).toList();
    return values.map((value) => HouseEntrythird.fromSheets(value)).toList();
  }

  //Todo:forth sheet
  Future<List<HouseEntryforth>> getHousesforth()async{
    final values = (await _worksheet3.values.allRows()).skip(1).toList();
    return values.map((value) => HouseEntryforth.fromSheets(value)).toList();
  }

  //Todo:five Sheet
Future<List<HouseEntyfive>?> getHousesfive()async{
    final values = (await _worksheet4.values.allRows()).skip(1).toList();
    return values.map((value) => HouseEntyfive.fromSheets(value) ).toList();
}


  Future<bool> deleteHouse(int index) {
    /// We add one to the index so that we can:v
    /// 1. Start at index 1
    /// 2. Skip the first row
    return _worksheet.deleteRow(index + 2);

  }

// Future<bool> updatehouse(int index){
//   return _worksheet.updateTitle(index+1);
// }

// Future<bool> addHouse(String name, String address ,String text) {
//   return _worksheet.values.appendRow([name, address,text]);
// }
}
