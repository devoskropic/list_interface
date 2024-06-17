import 'package:flutter/material.dart';

class CustomerModel {
  String title;
  String refers;
  String iconPath;
  Color boxColor;
  bool viewIsSelected;

  CustomerModel({
    required this.title,
    required this.refers,
    required this.iconPath,
    required this.boxColor,
    required this.viewIsSelected,
  });

  // Access Methods
  static List<CustomerModel> getOptions() {
    List<CustomerModel> option = [];

    option.add(
      CustomerModel(
        title: 'Booking history',
        refers: 'Keep an eye of your services',
        iconPath: 'assets/icons/clean_calendar.svg',
        boxColor: Colors.blueAccent.shade400,
        viewIsSelected: true,
      ),
    );

    option.add(
      CustomerModel(
        title: 'New appointment',
        refers: 'I wanna feel beauty',
        iconPath: 'assets/icons/edit.svg',
        boxColor: Colors.greenAccent.shade400,
        viewIsSelected: false,
      ),
    );

    option.add(
      CustomerModel(
        title: "Buy",
        refers: 'I need to get some stuff',
        iconPath: 'assets/icons/sale.svg',
        boxColor: Colors.orangeAccent.shade400,
        viewIsSelected: false,
      ),
    );

    option.add(
      CustomerModel(
        title: "Settings",
        refers: 'I need to change my avatar',
        iconPath: 'assets/icons/calendar_time.svg',
        boxColor: Colors.blueAccent.shade400,
        viewIsSelected: false,
      ),
    );

    return option;
  }
}
