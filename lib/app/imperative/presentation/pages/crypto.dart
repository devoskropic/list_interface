import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:line_icons/line_icons.dart';
import 'package:list_interface/app/imperative/domain/providers/imports.dart';
import 'package:list_interface/app/imperative/domain/repositories/exchange.dart';

class CryptoHome extends StatelessWidget {
  const CryptoHome({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // get repositories data
    final ExchangeRepository exchRepo = context.read();
    return ChangeNotifierProvider(
        create: (_) => HomeProvider(exchRepo: exchRepo)..init(),
        builder: (context, _) {
          final HomeProvider home = context.watch();
          return Scaffold(
            appBar: appBar(),
            body: ListView(
              children: [
                verticalViews(theme, home),
              ],
            ),
          );
        });
  }

  Column verticalViews(ThemeData theme, HomeProvider home) {
    final state = home.state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Text(
            "Vertical views [Cryptos]",
            style: theme.textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 20),
        (state is HomeStateLoading)
            ? const Center(child: CircularProgressIndicator())
            : (state is HomeStateLoaded)
                ? ListView.separated(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.cryptos.length,
                    separatorBuilder: (_, index) => const SizedBox(height: 15),
                    itemBuilder: (_, index) {
                      final crypt = state.cryptos[index];
                      return ListTile(
                        style: theme.listTileTheme.style,
                        // tileColor: Colors.black12,
                        title: Text(crypt.id),
                        subtitle: Text(crypt.symbol),
                        trailing: Text(
                          "\$${(crypt.price).toStringAsFixed(2)}",
                          // style: theme.textTheme.titleMedium,
                        ),
                      );
                    },
                  )
                : const Center(child: Text("ERROR")),
        const SizedBox(height: 20),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      // backgroundColor: Colors.white,
      title: const Text("Cryptoz"),
      leadingWidth: 50, //default is 56

      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(LineIcons.verticalEllipsis),
                tooltip: "Options",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
