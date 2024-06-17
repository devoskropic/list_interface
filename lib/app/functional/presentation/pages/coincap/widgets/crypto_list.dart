import 'package:flutter/material.dart';
import 'package:list_interface/app/functional/domain/models/crypto/crypto.dart';

class CryptoList extends StatelessWidget {
  final List<Crypto> cryptos;

  const CryptoList({super.key, required this.cryptos});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView.separated(
      padding: const EdgeInsets.only(left: 20, right: 20),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: cryptos.length,
      separatorBuilder: (_, index) => const SizedBox(height: 15),
      itemBuilder: (_, index) {
        final crypto = cryptos[index];
        return ListTile(
          style: theme.listTileTheme.style,
          // tileColor: Colors.black12,
          title: Text("${crypto.id} [${crypto.symbol}]"),
          subtitle: Text(crypto.explorer),
          trailing: Text(
            "\$${crypto.price.toStringAsFixed(2)}",
          ),
        );
      },
    );
  }
}
