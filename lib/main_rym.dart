import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'package:list_interface/app/functional/data/repo_impl/rym/rym_repo_impl.dart';
import 'package:list_interface/app/functional/data/services/rick_morty_api.dart';
import 'package:list_interface/app/functional/domain/repository/rym/rym_repository.dart';
import 'package:list_interface/app/functional/functional_imports.dart';
import 'package:list_interface/app/functional/presentation/pages/imports.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<RickMortyRepository>(
          create: (_) => RymRepositoryImpl(
            RickMortyAPI(Client()),
          ),
        ),
      ],
      child: const MainApp(
        home: HomeRyM(),
      ),
    ),
  );
}
