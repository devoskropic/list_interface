import 'package:flutter/material.dart';
// import 'package:list_interface/app/functional/domain/models/crypto/constants.dart';

class OptionsModel {
  int id;
  String title;
  String iconPath;
  Color boxColor;
  // String url;

  OptionsModel({
    required this.id,
    required this.title,
    required this.iconPath,
    required this.boxColor,
    // required this.url,
  });

  // Access Methods
  static List<OptionsModel> getOptions() {
    List<OptionsModel> categories = [];

    categories.add(
      OptionsModel(
        id: 0,
        title: 'todas',
        iconPath: 'assets/crypto_icons/blockchain.svg',
        boxColor: Colors.blueAccent.shade400,
        // url: "",
      ),
    );

    categories.add(
      OptionsModel(
        id: 1,
        title: 'bitcoin',
        iconPath: 'assets/crypto_icons/bitcoin.svg',
        boxColor: Colors.greenAccent.shade400,
      ),
    );

    categories.add(
      OptionsModel(
        id: 2,
        title: "ethereum",
        iconPath: 'assets/crypto_icons/ethereum.svg',
        boxColor: Colors.orangeAccent.shade400,
      ),
    );

    categories.add(
      OptionsModel(
        id: 3,
        title: "dogecoin",
        iconPath: 'assets/crypto_icons/dogi.svg',
        boxColor: Colors.blueAccent.shade400,
      ),
    );

    categories.add(
      OptionsModel(
        id: 4,
        title: 'shiba-inu',
        iconPath: 'assets/crypto_icons/shiba.svg',
        boxColor: Colors.greenAccent.shade400,
      ),
    );

    return categories;
  }
}
