class MainModel {
  final int id_main;
  final String id_engl;
  final String id_esp;
  final String phrase;
  final String picture_path;
  static final columns = ["id_main", "id_engl", "id_esp", "phrase", "picture_path"];
  MainModel(this.id_main, this.id_engl, this.id_esp, this.phrase, this.picture_path);
  factory MainModel.fromMap(Map<String, dynamic> data) {
    return MainModel(
      data['id_main'],
      data['id_engl'],
      data['id_esp'],
      data['phrase'],
      data['picture_path'],
    );
  }
  Map<String, dynamic> toMap() => {
    "id_main": id_main,
    "id_engl": id_engl,
    "id_esp": id_esp,
    "phrase": phrase,
    "picture_path": picture_path
  };
}