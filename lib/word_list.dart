import 'package:flutter/material.dart';
import 'db_helper.dart';

class WordList extends StatefulWidget {
  final List<Word> wordList;

  WordList(this.wordList, {super.key});

  @override
  WordListState createState() => WordListState();
}

class WordListState extends State<WordList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Word List"),
      ),
      body: SizedBox(width: double.infinity, child: SingleChildScrollView(
          child: Padding( padding: const EdgeInsets.all(18),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(bottom: 15),
                child: Text('All objects you can find', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87))),
                for(var item in widget.wordList ) Padding(padding: const EdgeInsets.only(top: 15), child: Text('${item.english} - ${item.spanish}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54)))
              ],
      ))),
    ));
  }
}
