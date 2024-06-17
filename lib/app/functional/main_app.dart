import 'package:flutter/material.dart';

import 'package:list_interface/app/functional/presentation/themes/main_theme.dart';

class MainApp extends StatelessWidget {
  final StatelessWidget home;

  const MainApp({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API\'s & Stuff',
      theme: mainTheme(),
      home: home,
      debugShowCheckedModeBanner: false,
    );
  }
}
