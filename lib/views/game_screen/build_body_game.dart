import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gatech/const.dart';
import 'package:gatech/views/game_screen/build_image.dart';

class buildBodyGame extends StatefulWidget {
  const buildBodyGame({
    Key? key,
  }) : super(key: key);

  @override
  State<buildBodyGame> createState() => _buildBodyGameState();
}

class _buildBodyGameState extends State<buildBodyGame> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          FadeInDown(
            delay: Duration(milliseconds: 500),
            child: Container(
                child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey.shade600,
                    indicatorColor: Colors.black,
                    tabs: [
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
                ])),
          ),
          Expanded(
            child: TabBarView(
              children: [
                buildImage(ESPORT_NEWS),
                buildImage(GAME_PC),
                buildImage(GAME_CONSOLE),
                buildImage(GAME_REVIEW),
              ],
            ),
          )
        ],
      ),
    );
  }
}
