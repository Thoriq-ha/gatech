import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gatech/const.dart';
import 'package:gatech/views/tech_screen/build_image.dart';

class BuildBodyTech extends StatefulWidget {
  const BuildBodyTech({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildBodyTech> createState() => _BuildBodyTechState();
}

class _BuildBodyTechState extends State<BuildBodyTech> {
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
                    text: "Update",
                  ),
                  Tab(
                    text: "Review",
                  ),
                  Tab(
                    text: "Recommended",
                  ),
                  Tab(
                    text: "Tips",
                  )
                ]),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                BuildImage(techUpdate),
                BuildImage(techReview),
                BuildImage(techRecomended),
                BuildImage(techTip),
              ],
            ),
          )
        ],
      ),
    );
  }
}
