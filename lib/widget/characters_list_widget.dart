import 'package:find_test/widget/slide_panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';

import '../model/character_model.dart';
import '../store/characters_store.dart';

class CharactersListWidget extends StatefulWidget {
  const CharactersListWidget(
      {super.key,
      required this.store,
      required this.panelController,
      required this.characters});
  final CharactersStore store;
  final SlidingUpPanelController panelController;
  final List<Results> characters;

  @override
  State<CharactersListWidget> createState() => _CharactersListWidgetState();
}

class _CharactersListWidgetState extends State<CharactersListWidget> {
  Results? character;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            itemCount: widget.characters.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        blurRadius: 1.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                        offset: const Offset(
                          0.0, // Move to right 10  horizontally
                          5.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      widget.panelController.expand();
                      setState(() {
                        character = widget.characters[index];
                      });
                    },
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                              "${widget.characters[index].thumbnail.path.toString()}.${widget.characters[index].thumbnail.ext.toString()}",
                              width: 180),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.characters[index].name.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    widget.characters[index].description
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey[600]),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "More Info",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child:
                                            Icon(Icons.arrow_drop_up_outlined),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
        SlidePanelWidget(
          panelController: widget.panelController,
          character: character,
        ),
      ],
    );
  }
}
