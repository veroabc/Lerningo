import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'main_model.dart';

class SQLiteDbProvider {
  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
  Database? _database;
  static int get _version => 1;
  final String dbFileName = "lerningo.db";
  final String dbName = "LerningoDB";

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  Future<List<Word>> getAllWords() async {
    final db = await database;

    if (db == null) {
      return [];
    }

    List<Map<String, dynamic>>
    results = await db.rawQuery(
      """
      SELECT * FROM Main
      INNER JOIN english ON Main.id_engl = english.id_engl
      INNER JOIN spanish ON Main.id_esp = spanish.id_esp
      """
    );

    List<Word> words = [];
    for (var result in results) {
      Word word = Word.fromMap(result);
      words.add(word);
    }
    return words;
  }

  Future<Word?> getWordByID(int id) async {
    final db = await database;

    if (db == null) {
      return null;
    }

    var result = await db.rawQuery(
    """
    SELECT * FROM Main
    INNER JOIN english ON Main.id_engl = english.id_engl
    INNER JOIN spanish ON Main.id_esp = spanish.id_esp
    WHERE id_main = $id;
    """);

    return result.isNotEmpty ? Word.fromMap(result.first) : null;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);

    ByteData data = await rootBundle.load(join("assets", dbFileName));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);

    return await openDatabase(path);
  }
}


class Word {
  final String english;
  final String spanish;
  final int id;

  Word(this.english, this.id, this.spanish);
  factory Word.fromMap(Map<String, dynamic> data) {
    return Word(
      data['engl_name'],
      data['id_engl'],
      data['esp_name'],
    );
  }
}
