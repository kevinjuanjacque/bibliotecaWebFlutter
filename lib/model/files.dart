class Files {
  List<File> items = new List();

  Files();

  Files.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    }
    jsonList.forEach((element) => items.add(File.fromJsonMap(element)));
  }
}

class File {
  String estado;
  String id;
  String name;
  String email;
  String dir;
  String descripcion;
  // ignore: non_constant_identifier_names
  String Tipo;
  // ignore: non_constant_identifier_names
  String Asignatura;
  File(
      {this.estado,
      this.id,
      this.name,
      this.email,
      this.dir,
      this.descripcion,
      // ignore: non_constant_identifier_names
      this.Tipo,
      // ignore: non_constant_identifier_names
      this.Asignatura});

  File.fromJsonMap(Map<String, dynamic> json) {
    this.estado = json['estado'];
    this.id = json['_id'];
    this.name = json['name'];
    this.email = json['email'];
    this.dir = json['dir'];
    this.descripcion = json['descripcion'];
    this.Tipo = json['Tipo'];
    this.Asignatura = json['Asignatura'];
  }
}
