import 'dart:ffi';

class MainModel {
  final int id_main;
  final int id_engl;
  final int id_esp;
  final String phrase;
  final String picture_path;
  final Int points;

  static final columns = ["id_main", "id_engl", "id_esp", "phrase", "picture_path", "points"];
  MainModel(this.id_main, this.id_engl, this.id_esp, this.phrase, this.picture_path, this.points);
  factory MainModel.fromMap(Map<String, dynamic> data) {
    return MainModel(
      data['id_main'],
      data['id_engl'],
      data['id_esp'],
      data['phrase'],
      data['picture_path'],
      data['points'],
    );
  }
  Map<String, dynamic> toMap() => {
    "id_main": id_main,
    "id_engl": id_engl,
    "id_esp": id_esp,
    "phrase": phrase,
    "picture_path": picture_path,
    "points": points
  };
}