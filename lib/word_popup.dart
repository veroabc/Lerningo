import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_app/db_helper.dart';

import 'dry_intrinsic_width.dart';

Future<void>buildWordPopup(BuildContext context, Word word, Function()? onClose) {
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

/*return AlertDialog(
        scrollable: true,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: const EdgeInsets.only(top: 15),
                  child: Text(word.english, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),)),
              Padding(padding: const EdgeInsets.only(top: 15, bottom: 25),
                  child: Text(word.spanish, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),)),
              Padding(padding: EdgeInsets.only(top: 15, bottom: 25), child: Wrap(
                spacing: 1.0,
                children: [
                  Text(word.exampleText.split("%s")[0]),
                  DryIntrinsicWidth(
                    child: Container(width: word.english.length.toDouble() * 11, height: 20,
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                          ),
                        )),
                  ),
                  Text(word.exampleText.split("%s")[1]),
                ],
              )),
              ElevatedButton( onPressed: () {
                Navigator.pop(context);
                onClose!();
              }, style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                child: const Text('COMPLETE'), )
            ],
          ),
      );
 */