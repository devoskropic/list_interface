import 'package:flutter/material.dart';

class VerticalViews extends StatelessWidget {
  const VerticalViews({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Vertical views",
            style: theme.textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 15),
        ListView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black12,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text("Hello"),
            ),
            const SizedBox(height: 15),
            ListTile(
              style: theme.listTileTheme.style,
              // tileColor: Colors.black12,
              title: const Text("List tile one"),
              subtitle: const Text("Of many possibly"),
              trailing: IconButton(
                onPressed: () {},
                iconSize: 40,
                icon: const Icon(Icons.one_k_plus),
              ),
            ),
            const SizedBox(height: 15),
            ListTile(
              style: theme.listTileTheme.style,
              // tileColor: Colors.black12,
              title: const Text("List tile two"),
              subtitle: const Text("this is partial"),
              trailing: IconButton(
                onPressed: () {},
                iconSize: 40,
                icon: const Icon(Icons.one_k_plus),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ],
    );
  }
}
