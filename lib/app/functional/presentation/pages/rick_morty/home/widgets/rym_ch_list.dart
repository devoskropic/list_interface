import 'package:flutter/material.dart';
import 'package:list_interface/app/functional/domain/models/rick_morty/character.dart';

class RyMCharacterList extends StatelessWidget {
  final List<Character> characterList;

  const RyMCharacterList({super.key, required this.characterList});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView.separated(
      padding: const EdgeInsets.only(left: 20, right: 20),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: characterList.length,
      separatorBuilder: (_, index) => const SizedBox(height: 15),
      itemBuilder: (_, index) {
        final crypto = characterList[index];
        return ListTile(
          style: theme.listTileTheme.style,
          // tileColor: Colors.black12,
          title: Text(crypto.name),
          subtitle:
              Text("Status: ${crypto.status} \nSpecie: ${crypto.species}"),
          trailing: const Text("image will be here"),
        );
      },
    );
  }
}
