import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_seneca/src/models/alumnos_centro_model.dart';

class AlumnosProvider {
  String _spreadsheetId = '1jgunJQNbekgH_XiwuNy9xo7plPtHwJUd9ksTgALlD9Q';
  String _url = 'script.google.com';
  String _sheet = 'Alumnos';

  Future<List<Alumno>> getAlumnos(argumento) async {
    final url = Uri.https(
        _url,
        'macros/s/AKfycbyT2uOq1eT1kc9sdGmUX3-E3YsLw6T6igs5_n0aaaKkFXtZITUjqlSEKQW2UeH4PSeA/exec',
        {
          'spreadsheetId': _spreadsheetId,
          'sheet': _sheet,
          //Pasamos por aqui el argumento para que nos muestre la lista solo con los elementos filtrados por el argumento en el alumnado_page.dart
          'curso': argumento,
        });
    print(url);

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    print(decodeData);

    final alumno = new Alumnos.fromJsonList(decodeData);

    return alumno.items;
  }
}
