import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gatech/const.dart';
import 'package:gatech/views/tech_screen/build_image.dart';

class buildBodyTech extends StatefulWidget {
  const buildBodyTech({
    Key? key,
  }) : super(key: key);

  @override
  State<buildBodyTech> createState() => _buildBodyTechState();
}

class _buildBodyTechState extends State<buildBodyTech> {
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
                buildImage(TECH_UPDATE),
                buildImage(TECH_REVIEW),
                buildImage(TECH_RECOMMENDED),
                buildImage(TECH_TIP),
              ],
            ),
          )
        ],
      ),
    );
  }
}
