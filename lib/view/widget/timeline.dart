import 'dart:math';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:waitress/view/widget/timeline_slider.dart';
import 'package:random_x/random_x.dart';

class TimeLine extends StatelessWidget {
  final cardWith = 384.0;
  final cardHeight = 144.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              int rowCount = (constraints.maxWidth / cardWith).floor();
              print(rowCount);
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                DateUtil.formatDate(
                                    (DateTime.now().add(
                                      Duration(days: -1 * index),
                                    )),
                                    format: DateFormats.zh_y_mo_d),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          GridView(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: rowCount,
                              mainAxisExtent: cardHeight,
                            ),
                            children: [
                              for (int i = 0; i < 10 + index; i++)
                                SizedBox(
                                  height: cardHeight,
                                  width: cardWith,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surfaceVariant,
                                        ),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          onTap: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Row(children: [
                                              SizedBox(
                                                width: 100,
                                                height: 100,
                                                child: Placeholder(),
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      RndX.randomString(
                                                        type:
                                                            RandomCharStringType
                                                                .alphaNumerical,
                                                        length: (Random()
                                                                    .nextInt(
                                                                        30) +
                                                                10)
                                                            .floor(),
                                                      ),
                                                      style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      maxLines: 4,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      );
                    }, childCount: 10),
                  ),
                ],
              );
            }),
          ),
          SizedBox(
            width: 40,
            child: TimelineSlider(),
          ),
        ],
      ),
    );
  }
}
