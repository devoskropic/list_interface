import 'package:flutter/material.dart';

class CategoryModel {
  String title;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.title,
    required this.iconPath,
    required this.boxColor,
  });

  // Access Methods
  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        title: 'Citas',
        iconPath: 'assets/icons/clean_calendar.svg',
        boxColor: Colors.blueAccent.shade400,
      ),
    );

    categories.add(
      CategoryModel(
        title: 'Clientes',
        iconPath: 'assets/icons/customer.svg',
        boxColor: Colors.greenAccent.shade400,
      ),
    );

    categories.add(
      CategoryModel(
        title: "Horarios",
        iconPath: 'assets/icons/open3.svg',
        boxColor: Colors.orangeAccent.shade400,
      ),
    );

    categories.add(
      CategoryModel(
        title: "Servicios",
        iconPath: 'assets/icons/svc.svg',
        boxColor: Colors.blueAccent.shade400,
      ),
    );

    categories.add(
      CategoryModel(
        title: 'Productos',
        iconPath: 'assets/icons/prod.svg',
        boxColor: Colors.greenAccent.shade400,
      ),
    );

    return categories;
  }
}
