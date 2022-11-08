import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'main_model.dart';

class SQLiteDbProvider {
  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
  Database? _database;
  static int get _version => 1;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  Future<List<MainModel>?> getAllWords() async {
    final db = await database;

    if (db == null) {
      return null;
    }

    List<Map<String, dynamic>>
    results = await db.query("Main", columns: MainModel.columns);

    List<MainModel> words = [];
    for (var result in results) {
      MainModel product = MainModel.fromMap(result);
      words.add(product);
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
    WHERE id_main = $id;
    """);

    return result.isNotEmpty ? Word.fromMap(result.first) : null;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Lerningo.db");
    return await openDatabase(
        path,
        version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute(
            "CREATE TABLE engl_synonyms ("
                "id_engl_syn INTEGER,"
                "engl_syn_name VARCHAR(50),"
                "PRIMARY KEY (id_engl_syn)"
                ");"
          );

          await db.execute(
              "CREATE TABLE english ("
                  "id_engl INTEGER,"
                  "engl_name VARCHAR(50),"
                  "id_engl_syn INTEGER,"
                  "PRIMARY KEY (id_engl),"
                  "FOREIGN KEY (id_engl_syn)"
                  "REFERENCES engl_synonyms(id_engl_syn)"
                  ");"
          );

          await db.execute(
              """
              CREATE TABLE Main (
                id_main INTEGER, 
                id_engl INTEGER, 
                id_esp INTEGER, 
                phrase VARCHAR (255), 
                picture_path VARCHAR (255), 
                soundfile_path VARCHAR (255), 
                PRIMARY KEY (id_main), 
                FOREIGN KEY (id_engl) REFERENCES english(id_engl));
              """
          );
            await db.rawInsert("INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (1,1,1,'The Teacher writes on the %s.',null,null);");
            await db.rawInsert("INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (2,2,2,'Rosi puts the book on the %s.',null,null);");
            await db.rawInsert("INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (1,'Board',1);");
            await db.rawInsert("INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (2,'Table',2);");
          }
    );
  }
}


class Word {
  final String english;
  final int id;

  Word(this.english, this.id);
  factory Word.fromMap(Map<String, dynamic> data) {
    return Word(
      data['engl_name'],
      data['id_engl'],
    );
  }
}
