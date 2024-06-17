import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:list_interface/app/functional/domain/provider/coincap/imports.dart';
import 'package:list_interface/app/functional/presentation/pages/coincap/widgets/error_http.dart';
import 'package:list_interface/app/functional/presentation/pages/coincap/widgets/crypto_list.dart';

class CryptoState extends StatelessWidget {
  const CryptoState({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final CoincapProvider homeProvider = context.watch();

    return SingleChildScrollView(
      // aqui una consulta al STATE que voy a definir o al index que tengo en coincapProvider
      // check index if is mayor que 0 el child sera solo la cripto correspondiente de ese index
      // (hay que hacer la consulta correspondiente a la api)
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: homeProvider.state.maybeMap(
              singleLoaded: (state) {
                final crypto = state.cryptos[0];
                return Text(
                  crypto.id,
                  style: theme.textTheme.titleMedium,
                );
              },
              orElse: () => Text(
                "List of cryptos",
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
          const SizedBox(height: 20),
          homeProvider.state.map(
            loading: (_) => const Center(child: CircularProgressIndicator()),
            failed: (state) => ErrorHttp(failure: state.failure),
            loaded: (state) => CryptoList(cryptos: state.cryptos),
            singleLoaded: (state) => const Placeholder(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
