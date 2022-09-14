

import 'package:alpata_assignment/core/extensions/size_extension.dart';
import 'package:flutter/material.dart';

import '../models/scrolling_text_model.dart';

class ScrollingTextCard extends StatelessWidget {
  const ScrollingTextCard({Key? key, this.currentTextModel}) : super(key: key);
  final Data? currentTextModel;
  @override
  Widget build(BuildContext context) {
    return Card(
                              elevation: 3,
                              child: SizedBox(
                                width: context.setScaledWidth(0.50),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      currentTextModel?.mALADI ?? "Null",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "En Az : ${currentTextModel?.enAz.toString()}",
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                        "En Çok : ${currentTextModel?.enCok.toString()}",
                                        style: const TextStyle(
                                            color: Colors.green)),
                                  ],
                                ),
                              ));
  }
}