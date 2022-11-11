import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_app/db_helper.dart';
import 'dry_intrinsic_width.dart';

Path drawStar(Size size) {
  // Method to convert degree to radians
  double degToRad(double deg) => deg * (pi / 180.0);

  const numberOfPoints = 5;
  final halfWidth = size.width / 2;
  final externalRadius = halfWidth;
  final internalRadius = halfWidth / 2.5;
  final degreesPerStep = degToRad(360 / numberOfPoints);
  final halfDegreesPerStep = degreesPerStep / 2;
  final path = Path();
  final fullAngle = degToRad(360);
  path.moveTo(size.width, halfWidth);

  for (double step = 0; step < fullAngle; step += degreesPerStep) {
    path.lineTo(halfWidth + externalRadius * cos(step),
        halfWidth + externalRadius * sin(step));
    path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
        halfWidth + internalRadius * sin(step + halfDegreesPerStep));
  }
  path.close();
  return path;
}


Future<void>buildWordPopup(BuildContext context, Word word, Function()? onClose,
    Function()? onValid) {
  var canSubmit = false;

  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            scrollable: true,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.only(top: 15),
                    child: Row(children: [
                      Padding(padding: EdgeInsets.only(right: 6), child: Image.asset('assets/icon_english.png', height: 30)),
                      Text(word.english, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),)
                    ])),
                Padding(padding: const EdgeInsets.only(top: 15, bottom: 25),
                    child: Row(children: [
                      Padding(padding: EdgeInsets.only(right: 6), child: Image.asset('assets/icon_spanish.png', height: 30)),
                      Text(word.spanish, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),)
                    ],)),
                Padding(padding: EdgeInsets.only(top: 15, bottom: 25), child: Wrap(
                  spacing: 1.0,
                  children: [
                    Text(word.exampleText.split("%s")[0]),
                    DryIntrinsicWidth(
                      child: Container(width: word.english.length.toDouble() * 11, height: 20,
                          child: TextField(
                            onChanged: (value) => {
                              if (value.toLowerCase() == word.english.toLowerCase()) {
                                setState(() {
                                canSubmit = true;
                                })
                              }
                            },
                            maxLines: 1,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                            ),
                          )),
                    ),
                    Text(word.exampleText.split("%s")[1]),
                  ],
                )),
                ElevatedButton( onPressed: () {
                  if (!canSubmit) {
                    return;
                  }
                  Navigator.pop(context);
                  onClose!();
                }, style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20), backgroundColor: canSubmit ? Colors.deepOrange : Colors.black12, ),
                  child: const Text('COMPLETE'), )
              ],
            ),
          );
        },
      );
    },
  );
}
