import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gatech/const.dart';
import 'package:gatech/views/game_screen/build_image.dart';

class BuildBodyGame extends StatefulWidget {
  const BuildBodyGame({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildBodyGame> createState() => _BuildBodyGameState();
}

class _BuildBodyGameState extends State<BuildBodyGame> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          FadeInDown(
            delay: const Duration(milliseconds: 500),
            child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.shade600,
                indicatorColor: Colors.black,
                tabs: const [
                  Tab(
                    text: "E-Sport",
                  ),
                  Tab(
                    text: "PC",
                  ),
                  Tab(
                    text: "Console",
                  ),
                  Tab(
                    text: "Review",
                  )
                ]),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                BuildImage(esportNews),
                BuildImage(gamePc),
                BuildImage(gameConsole),
                BuildImage(gameReview),
              ],
            ),
          )
        ],
      ),
    );
  }
}
