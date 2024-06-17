import 'package:flutter/material.dart';

import 'package:list_interface/app/imperative/presentation/pages/imports.dart';
import 'package:list_interface/app/imperative/presentation/themes/main_theme.dart';

class ImperativeMainApp extends StatelessWidget {
  const ImperativeMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dummyland",
      theme: mainTheme(),
      // home: HomePage(),
      // home: Home(),
      home: const CryptoHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
