import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:list_interface/app/functional/domain/provider/rym/rym_provider.dart';
import 'package:list_interface/app/functional/presentation/pages/coincap/widgets/imports.dart';
import 'package:list_interface/app/functional/presentation/pages/rick_morty/home/widgets/rym_ch_list.dart';

import 'package:list_interface/app/functional/domain/repository/rym/rym_repository.dart';

class RmBody extends StatelessWidget {
  const RmBody({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   final RymProvider rymProvider = context.watch();
  //   // final RymProvider rymProvider;
  //   // rymProvider.retrieveCharacter();
  //   // var appState = context.watch<RymProvider>();
  //   // appState.retrieveCharacter();
  //   return Center(
  //     child: rymProvider.state.mapOrNull(
  //       loading: (_) => const Center(child: CircularProgressIndicator()),
  //       failed: (state) => HomeError(failure: state.failure),
  //       characterLoaded: (state) =>
  //           RyMCharacterList(characterList: state.character),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final RickMortyRepository rymRepo = context.read();

    return ChangeNotifierProvider(
        create: (_) => RymProvider(
              rymRepo: rymRepo,
              // ),
            )..retrieveCharacter(),
        builder: (context, _) {
          final RymProvider rymProvider = context.watch();
          return Center(
            child: rymProvider.state.mapOrNull(
              loading: (_) => const Center(child: CircularProgressIndicator()),
              failed: (state) => ErrorHttp(failure: state.failure),
              characterLoaded: (state) =>
                  RyMCharacterList(characterList: state.character),
            ),
          );
        });
  }
}
