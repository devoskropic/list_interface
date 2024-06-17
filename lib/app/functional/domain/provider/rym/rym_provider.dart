import 'package:flutter/material.dart';
import 'dart:async';
import 'rym_state.dart';
import 'package:list_interface/app/functional/domain/models/rick_morty/constants.dart';
import 'package:list_interface/app/functional/domain/repository/rym/rym_repository.dart';

class RymProvider extends ChangeNotifier {
  final RickMortyRepository rymRepo;

  RymProvider({required this.rymRepo});

  RymState _state = const RymState.loading();
  RymState get state => _state;

  Future<void> retrieveCharacter() async {
    state.whenOrNull(
      loading: () {
        _state = const RymState.loading();
        notifyListeners();
      },
    );

    final result = await rymRepo.getCharacterById(charIds);

    _state = result.when(
      left: (failure) => RymState.failed(failure),
      right: (character) => RymState.characterLoaded(character: character),
    );

    notifyListeners();
  }
}
