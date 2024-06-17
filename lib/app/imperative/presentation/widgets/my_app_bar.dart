import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:list_interface/app/functional/presentation/pages/misc/settings.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.name, Function()? onPressed});

  final String name;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[800],
      primary: true,
      shadowColor: Colors.black,
      elevation: 3,
      titleTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      title: Text("Hola $name"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: const Icon(LineIcons.bell),
                tooltip: "Notificaciones",
                constraints: const BoxConstraints(
                  minHeight: 20.0,
                  minWidth: 25.0,
                ),
              ),
              IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: const Icon(LineIcons.shoppingBag),
                tooltip: "Historial de Compras",
                constraints: const BoxConstraints(
                  minHeight: 20.0,
                  minWidth: 25.0,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Settings(),
                    ),
                  );
                },
                color: Colors.white,
                icon: const Icon(LineIcons.verticalEllipsis),
                tooltip: "Opciones",
                constraints: const BoxConstraints(
                  minHeight: 20.0,
                  minWidth: 25.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
