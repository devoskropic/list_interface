import 'package:flutter/material.dart';

ThemeData mainTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
    scaffoldBackgroundColor: Colors.white,
    // Text
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
    ),
    // AppBar
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      color: Colors.teal.shade200,
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
    // ListTile
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      contentPadding: EdgeInsets.only(left: 10, right: 10),
      // leadingAndTrailingTextStyle: TextStyle(fontSize: 16),
    ),
  );
}
