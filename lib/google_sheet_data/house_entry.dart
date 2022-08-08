
// Todo: first data model
class HouseEntry {
  final String name;
  final String address;
  final String number;
  final String videoUrl;
  final String videoUrl1;

  HouseEntry({
    required this.name,
    required this.address,
    required this.number,
    required this.videoUrl,
    required this.videoUrl1,
  });


  factory HouseEntry.fromSheets(List<String> input) =>
      HouseEntry(name: input[0], address: input[1], number: input[2],videoUrl: input[3],videoUrl1: input[4]);
}


// Todo: second data model second slider cetegary
class  HouseEntrySecond {
  final String image;
  final String name;

  HouseEntrySecond({
    required this.image,
    required this.name,
  });

  factory HouseEntrySecond.fromSheet(List<String> input) =>
      HouseEntrySecond(image: input[0], name: input[1],);
}


// Todo: third data model third slider
class HouseEntrythird {
  final String image;
  final String name;
  final String videoUrl;
  //final String videoUrl;

  HouseEntrythird({
    required this.image,
    required this.name,
    required this.videoUrl
    //required this.videoUrl,
  });

  factory HouseEntrythird.fromSheets(List<String> input) =>
      HouseEntrythird(image: input[0], name: input[1],videoUrl: input[2]);
}


// Todo: forth data model third slider
class HouseEntryforth {
  final String name;
  final String adress;
  final String videoUrl;
  //final String videoUrl;

  HouseEntryforth({
    required this.name,
    required this.adress,
    required this.videoUrl
    //required this.videoUrl,
  });

  factory HouseEntryforth.fromSheets(List<String> input) =>
      HouseEntryforth(name: input[0],adress: input[1],videoUrl: input[2]);
}


// Todo: five data search top 10 slider
class HouseEntyfive{
  final String name;
  final String adress;
  final String videoUrl;

  HouseEntyfive({
   required this.name,
   required this.adress,
   required this.videoUrl,
});
  factory HouseEntyfive.fromSheets(List<String>input)=>
      HouseEntyfive(name: input[0], adress: input[1], videoUrl: input[2]);
}