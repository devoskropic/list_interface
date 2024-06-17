import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:list_interface/app/functional/domain/provider/coincap/imports.dart';
import 'package:line_icons/line_icons.dart';

class CryptoAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CryptoAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final CoincapProvider home = context.watch();

    return AppBar(
      // backgroundColor: Colors.white,
      title: home.state.mapOrNull(
        loaded: (state) => Text(
          state.wsStatus.when(
            connecting: () => 'Connecting',
            connected: () => 'Connected',
            failed: () => 'Failed',
            reconnecting: () => 'Reconnecting',
          ),
        ),
      ),
      // leading: IconButton(
      //   onPressed: () {},
      //   icon: const Icon(Icons.navigate_before),
      //   tooltip: 'Back',
      // ),
      // leading: Container(
      //   margin: const EdgeInsets.all(10),
      //   alignment: Alignment.center,
      //   // decoration: BoxDecoration(
      //   //   borderRadius: BorderRadius.circular(50),
      //   // ),
      //   child: IconButton(
      //     onPressed: () {},
      //     icon: const Icon(Icons.navigate_before),
      //   ),
      // ),
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
