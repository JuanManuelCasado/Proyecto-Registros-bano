class Persona {
  List<Personal> items = [];

  Persona();

  Persona.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final p = new Personal.fromJsonMap(item);
      items.add(p);
    }
  }
}

class Personal {
  String id;
  String usuario;
  String clave;
  String profesorA;
  String mail;
  String telefono;
  String dni;

  Personal({
    this.id,
    this.usuario,
    this.clave,
    this.profesorA,
    this.mail,
    this.telefono,
    this.dni,
  });

  Personal.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    usuario = json['usuario'];
    clave = json['clave'];
    profesorA = json['profesorA'];
    mail = json['mail'];
    telefono = json['telefono'];
    dni = json['dni'];
  }
}
