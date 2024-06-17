import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:list_interface/app/functional/functional_imports.dart'; //imperative_imports
import 'package:list_interface/app/functional/data/repo_impl/crypto/ws_repo_impl.dart';
import 'package:list_interface/app/functional/domain/repository/crypto/ws_repository.dart';
import 'package:list_interface/app/functional/domain/models/crypto/constants.dart';
import 'package:list_interface/app/functional/presentation/pages/imports.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<ExchangeRepository>(
          create: (_) => ExchangeRepositoryImpl(
            ExchangeAPI(Client()),
          ),
        ),
        Provider<WsRepository>(
          create: (_) => WsRepoImpl(
            (ids) => WebSocketChannel.connect(
              // Uri.parse(wsConn3),
              Uri.parse(
                wsConn2 + ids.join(','),
              ),
            ),
          ),
        ),
      ],
      // child: const ImperativeMainApp(),
      child: const MainApp(
        home: HomeCoincapCopy(),
      ),
    ),
  );
}

// home: const HomePage(),
// home: const JustCryptos(),
// home: const HomeCoincap(),
// home: const HomeRM(),
