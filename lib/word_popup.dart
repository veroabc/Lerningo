import 'package:flutter/material.dart';
import 'package:learning_app/db_helper.dart';
import 'main.dart';

Future<void>buildWordPopup(BuildContext context, Word word, Function()? onClose) {

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.only(top: 15),
                  child: Text(word.english, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),)),
              Padding(padding: const EdgeInsets.only(top: 15, bottom: 45),
                  child: Text(word.spanish, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),)),
              ElevatedButton( onPressed: () {
                Navigator.pop(context);
                onClose!();
              }, style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                child: const Text('COMPLETE'), )
            ],
          ),
      );
    },
  );
}
