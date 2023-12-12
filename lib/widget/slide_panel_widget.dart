import 'package:find_test/comics_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';

import '../model/character_model.dart';

class SlidePanelWidget extends StatelessWidget {
  final SlidingUpPanelController panelController;

  final Results? character;
  const SlidePanelWidget({
    super.key,
    required this.panelController,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    double minBound = 0;

    double upperBound = 1.0;

    return SlidingUpPanelWidget(
      panelStatus: SlidingUpPanelStatus.hidden,
      controlHeight: 50.0,
      anchor: 0.4,
      minimumBound: minBound,
      upperBound: upperBound,
      panelController: panelController,
      onTap: () {
        ///Customize the processing logic
        if (SlidingUpPanelStatus.expanded == panelController.status) {
          // panelController.collapse();
        } else {
          // panelController.collapse();
        }
      },
      enableOnTap: true,
      //Enable the onTap callback for control bar.
      dragDown: (details) {
        print('dragDown');
      },
      dragStart: (details) {
        print('dragStart');
      },
      dragCancel: () {
        print('dragCancel');
      },
      dragUpdate: (details) {
        print(
            'dragUpdate,${panelController.status == SlidingUpPanelStatus.dragging ? 'dragging' : ''}');
      },
      dragEnd: (details) {
        print("dragEnd");
        panelController.hide();
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        // margin: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
        ),
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: ShaderMask(
                          shaderCallback: (rect) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.transparent],
                            ).createShader(
                                Rect.fromLTRB(0, 300, rect.width, rect.height));
                          },
                          blendMode: BlendMode.dstIn,
                          child: Image.network(character != null
                              ? "${character?.thumbnail.path.toString()}.${character?.thumbnail.ext.toString()}"
                              : "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            character?.name ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          SizedBox(height: 20),
                          Text(
                            character?.description ?? "",
                            style: TextStyle(color: Colors.black54),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            child: Center(
                              child: Container(
                                color: Colors.red[900],
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Comics with ${character?.name}: ${character?.comics.items.length.toString()}" ??
                                            "",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: () => Navigator.of(context).push(
                                _createRoute(character!, character!.name)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              child: Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.horizontal_rule_rounded,
                  size: 50,
                  color: Colors.grey.shade600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Route _createRoute(Results character, String characterName) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ComicsPage(
      character: character,
      characterName: characterName,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
