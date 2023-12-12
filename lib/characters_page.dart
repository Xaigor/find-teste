import 'package:find_test/services/api_service.dart';
import 'package:find_test/state/characters_state.dart';
import 'package:find_test/store/characters_store.dart';
import 'package:find_test/widget/characters_list_widget.dart';
import 'package:find_test/widget/slide_panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';

import 'model/character_model.dart';

class CharactersPage extends StatefulWidget {
  CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final store = CharactersStore();
  late ScrollController scrollController;
  SlidingUpPanelController panelController = SlidingUpPanelController();
  Results? character;
  TextEditingController textController = TextEditingController();
  String text = "";

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.expand();
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.anchor();
      } else {
        // panelController.hide();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("TESTE"),
      // ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Image.asset('assets/marvel.png', height: 50),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              controller: textController,
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    gapPadding: 0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                    Center(
                      child: text == ""
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  text = textController.text;
                                });
                                store.fetchSpecificCharacter(
                                    textController.text);
                              },
                              icon: const Icon(
                                size: 30,
                                Icons.search,
                                color: Colors.red,
                              ))
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  textController.text = "";
                                  text = "";
                                });

                                store
                                    .fetchCharacters()
                                    .then((_) => textController.text = "");
                              },
                              icon: const Icon(
                                size: 30,
                                Icons.cancel,
                                color: Colors.red,
                              )),
                    )
                  ],
                ),
              ),
              Expanded(
                child: _checkCharacters(context, store, panelController),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_checkCharacters(BuildContext context, CharactersStore store,
    SlidingUpPanelController panelController) {
  return ValueListenableBuilder(
      valueListenable: store,
      builder: (_, state, child) {
        if (state is LoadingCharactersState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ErrorCharactersState) {
          return Center(child: Text(state.message));
        }
        if (state is SuccessCharactersState) {
          return CharactersListWidget(
              store: store,
              panelController: panelController,
              characters: state.characters);
        } else {
          return Container();
        }
      });
}
