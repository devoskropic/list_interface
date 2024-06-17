class PopularDishModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularDishModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected,
  });

  // String name;
  // String? iconPath;
  // String level;
  // String duration;
  // String? calorie;
  // final bool boxIsSelected;
  // PopularDishModel({
  //   required this.name,
  //   this.iconPath,
  //   this.level = 'Easy',
  //   this.duration = '25 mins',
  //   this.calorie,
  //   required this.boxIsSelected,
  // });

  static List<PopularDishModel> getPopularDiets() {
    List<PopularDishModel> popularDiets = [];

    popularDiets.add(PopularDishModel(
      name: 'Blueberry Pancake',
      iconPath: 'assets/icons/blueberry-pancake.svg',
      level: 'Medium',
      duration: '30 mins',
      calorie: '230 kCal',
      boxIsSelected: true,
    ));

    popularDiets.add(PopularDishModel(
      name: 'Salmon Nigiri',
      iconPath: 'assets/icons/salmon-nigiri.svg',
      level: 'Easy',
      duration: '20 mins',
      calorie: '120 kCal',
      boxIsSelected: false,
    ));

    // popularDiets.add(PopularDishModel(
    //   name: 'Aronou',
    //   iconPath: '',
    //   level: 'Easy',
    //   duration: '20mins',
    //   calorie: '120kCal',
    //   boxIsSelected: false,
    // ));

    return popularDiets;
  }
}
