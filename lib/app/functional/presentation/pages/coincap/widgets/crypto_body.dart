import 'package:flutter/material.dart';

import 'package:list_interface/app/functional/presentation/pages/home/widgets/imports.dart';
import 'package:list_interface/app/functional/presentation/pages/coincap/widgets/imports.dart';

class CryptoBody extends StatelessWidget {
  const CryptoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SearchField(),
        const SizedBox(height: 20),
        CategorySection(),
        const SizedBox(height: 20),
        CustomerSection(),
        const CryptoState(),
      ],
    );
  }
}
