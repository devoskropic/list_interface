import 'package:flutter/material.dart';
import 'package:list_interface/app/functional/presentation/pages/home/widgets/imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: ListView(
        children: [
          const SearchField(),
          const SizedBox(height: 20),
          CategorySection(),
          const SizedBox(height: 20),
          CustomerSection(),
          const SizedBox(height: 20),
          const VerticalViews(),
        ],
      ),
    );
  }
}
