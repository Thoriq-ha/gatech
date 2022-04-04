import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'build_body_tech.dart';

class TechScreen extends StatelessWidget {
  const TechScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    FadeInDown(
                      child: Row(
                        children: [
                          Text(
                            "Discover \nToday's Tech 💡",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade800,
                                height: 1.5),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 400),
                      duration: const Duration(milliseconds: 800),
                      child: Container(
                        height: 46,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8)),
                        child: TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey.shade700,
                              ),
                              border: InputBorder.none,
                              hintText: "Classic Style",
                              hintStyle:
                                  TextStyle(color: Colors.grey.shade500)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: const buildBodyTech());
  }
}
