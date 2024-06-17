import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:list_interface/app/functional/presentation/pages/home/widgets/imports.dart';
import 'package:list_interface/app/functional/presentation/pages/coincap/widgets/imports.dart';
import 'package:list_interface/app/functional/domain/provider/coincap/coincap_provider.dart';

class CryptoBodyCopy extends StatelessWidget {
  const CryptoBodyCopy({super.key});

  // _onOptionTap(int index, CoincapProvider provi, String id) {
  //  provi.switchIndex(index, id);
  // }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<CoincapProvider>();

    return ListView(
      children: [
        const SearchField(),
        const SizedBox(height: 20),
        // OptionSection(onTap: _onOptionTap),
        OptionSection(),
        if (appState.index > -1) const CryptoState(),
      ],
    );
  }
}
