import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class SQLiteDbProvider {
  /// DAL class for communicating with our database. It's a singleton pattern.

  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
  Database? _database;
  static int get _version => 1;
  final String dbFileName = "lerningo.db";
  final String dbName = "LerningoDB.db";

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
      LEFT JOIN scanned_objects ON scanned_objects.Main__id_main = Main.id_main;
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
    LEFT JOIN scanned_objects ON scanned_objects.Main__id_main = Main.id_main
    WHERE id_main = $id;
    """);

    return result.isNotEmpty ? Word.fromMap(result.first) : null;
  }

  Future<int?> getUserScore() async {
    final db = await database;

    if (db == null) {
      return null;
    }

    var result = await db.rawQuery(
      """
      SELECT SUM(points) as points FROM scanned_objects
      JOIN Main ON scanned_objects.main__id_main = Main.id_main;
      """
    );
    var score = int.parse(result[0]['points'].toString());
    return score;
  }

  Future insertScannedWord(int id) async {
    final db = await database;

    if (db == null) {
      return null;
    }

    var word = await getWordByID(id);

    if (word != null) {
      if (word.isScanned) {
        return;
      }
    }

    await db.insert('scanned_objects', {
      'Main__id_main': id
    });
  }

  getDBPath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    return join(documentsDirectory.path, dbName);
  }

  initDB() async {
    String path = await getDBPath();
    var syncPath = path;

    // for a file
    var isDBExisting = await File(syncPath).exists();

    if (isDBExisting) {
      return await openDatabase(path);
    }

    ByteData data = await rootBundle.load(join("assets", dbFileName));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);

    return await openDatabase(path);
  }
}


class Word {
  final int id;
  final String english;
  final String spanish;
  final String exampleText;
  final int points;
  final bool isScanned;

  Word(this.id, this.english, this.spanish, this.exampleText, this.points, this.isScanned);
  factory Word.fromMap(Map<String, dynamic> data) {
    return Word(
      data['id_main'],
      data['engl_name'],
      data['esp_name'],
      data['phrase'],
      data['points'],
      data['Main__id_main'] is int
    );
  }
}
