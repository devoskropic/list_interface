import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HomeAppBar({super.key, this.title = 'Widgets App'});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.white,
      title: Text(title),
      // leading: IconButton(
      //   onPressed: () {},
      //   icon: const Icon(Icons.navigate_before),
      //   tooltip: 'Back',
      // ),
      //   leading: Container(
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
