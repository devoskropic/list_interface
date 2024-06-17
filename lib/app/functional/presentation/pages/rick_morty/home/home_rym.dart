import 'package:flutter/material.dart';
// import 'package:list_interface/app/functional/domain/provider/rym/rym_provider.dart';
// import 'package:list_interface/app/functional/domain/repository/rym/rym_repository.dart';
import 'package:list_interface/app/functional/presentation/pages/rick_morty/home/widgets/rm_body.dart';
// import 'package:provider/provider.dart';

import 'package:list_interface/app/functional/presentation/pages/home/widgets/imports.dart';

class HomeRyM extends StatelessWidget {
  const HomeRyM({super.key});

  @override
  Widget build(BuildContext context) {
    // final RickMortyRepository rymRepo = context.read();

    return Scaffold(
      appBar: const HomeAppBar(title: "Rick & Morty API"),
      body: ListView(
        children: const [
          SizedBox(height: 15),
          RmBody(),
        ],
      ),
    );

    // return ChangeNotifierProvider(
    //   create: (_) => RymProvider(
    //     rymRepo: rymRepo,
    //     ),
    //   // )..retrieveCharacter(),
    //   builder: (context, _) {
    //     return const Scaffold(
    //       appBar: HomeAppBar(title: "Rick & Morty API"),
    //       body: RmBody(),
    //     );
    //   },
    // );
  }
}
