import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:list_interface/app/functional/domain/provider/coincap/imports.dart';
import 'package:list_interface/app/functional/domain/repository/crypto/imports.dart';
import 'package:list_interface/app/functional/presentation/pages/coincap/widgets/imports.dart';

class HomeCoincapCopy extends StatelessWidget {
  const HomeCoincapCopy({super.key});

  @override
  Widget build(BuildContext context) {
    final ExchangeRepository exchRepo = context.read();
    final WsRepository wsRepo = context.read();

    return ChangeNotifierProvider(
      create: (_) => CoincapProvider(
        exchRepo: exchRepo,
        wsRepo: wsRepo,
      ), // )..init(),
      builder: (context, _) {
        return const Scaffold(
          appBar: CryptoAppbar(),
          body: CryptoBodyCopy(),
        );
      },
    );
  }
}
