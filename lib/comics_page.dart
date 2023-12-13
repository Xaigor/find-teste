import 'package:flutter/material.dart';

import 'model/character_model.dart';

class ComicsPage extends StatelessWidget {
  final Results character;
  final String characterName;
  const ComicsPage(
      {super.key, required this.character, required this.characterName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.red[900],
          title: Text(
            characterName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
          itemCount: character.comics.items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(character.comics.items[index].name.toString()),
            );
          },
        ),
      ),
    );
  }
}
