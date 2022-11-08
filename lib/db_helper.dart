import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'main_model.dart';

class SQLiteDbProvider {
  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
  late Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;
    _database = await initDB();
    return _database;
  }

  Future<List<MainModel>> getAllWords() async {
    final db = await database;

    List<Map<String, dynamic>>
    results = await db.query("Main", columns: MainModel.columns);

    List<MainModel> words = [];
    for (var result in results) {
      MainModel product = MainModel.fromMap(result);
      words.add(product);
    }
    return words;
  }

  Future<Object> getWordByID(int id) async {
    final db = await database;
    var result = await db.query("Main", where: "id = ", whereArgs: [id]);

    return result.isNotEmpty ? MainModel.fromMap(result.first) : Null;
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
                "id_engl_syn INTEGER AUTOINCREMENT,"
                "engl_syn_name VARCHAR(50),"
                "PRIMARY KEY (id_engl_syn)"
                ");"
          );

          await db.execute(
              "CREATE TABLE english ("
                  "id_engl INTEGER AUTOINCREMENT,"
                  "engl_name VARCHAR(50),"
                  "id_engl_syn INTEGER,"
                  "PRIMARY KEY (id_engl),"
                  "FOREIGN KEY (id_engl_syn)"
                  "REFERENCES engl_synonyms(id_engl_syn)"
                  ");"
          );

          }
    );
  }
}

