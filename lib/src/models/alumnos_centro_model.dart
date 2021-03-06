// Generated by https://quicktype.io
class Alumnos {
  List<Alumno> items = [];

  Alumnos();

  Alumnos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final alumno = new Alumno.fromJsonMap(item);
      items.add(alumno);
    }
  }
}

class Alumno {
  String alumnoA;
  String unidad;

  Alumno({
    this.alumnoA,
    this.unidad,
  });
  Alumno.fromJsonMap(Map<String, dynamic> json) {
    alumnoA = json['Alumno/a'];
    unidad = json['Unidad'];
  }
}
