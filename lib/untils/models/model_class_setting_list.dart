class Setting{
  String image;
  String name;


  Setting({
    required this.image,
    required this.name,

  });
}



List<Setting> five =<Setting>[

  Setting(
     image: "asset/svg/coockiepolicy.svg",
      name: "Cookie policy",
     ),

  Setting(
      image: "asset/svg/privacy.svg",
      name: "Privacy policy",
      ),

  Setting(
      image: "asset/svg/tharmofservice.svg",
      name: "Terms of service",
    ),

  Setting(
      image: "asset/svg/rate.svg",
      name: "Rate our app",
      ),

  Setting(
      image: "asset/svg/shareourpage.svg",
      name: "Share our app",
     ),

  Setting(
      image:"asset/svg/ourotherapp.svg",
      name: "Our other apps",
      ),

  
];