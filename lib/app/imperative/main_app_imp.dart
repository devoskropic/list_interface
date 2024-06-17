import 'package:flutter/material.dart';
import 'package:list_interface/app/imperative/presentation/pages/imports.dart';
import 'package:list_interface/app/imperative/presentation/themes/main_theme.dart';

class MainAppImp extends StatelessWidget {
  const MainAppImp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dummyland",
      theme: mainTheme(),
      // home: HomePage(),
      home: Home(),
      // home: const CryptoHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
