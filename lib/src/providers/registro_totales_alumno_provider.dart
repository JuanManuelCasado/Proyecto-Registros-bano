import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_seneca/src/models/registros_bano_model.dart';

class InformesTotalesAlumnoProvider {
  String _spreadsheetId = '1zKQfM6XjYx-hW7YiSk55YT5r66nxWSG65b_steLwd0c';
  String _url = 'script.google.com';
  String _sheet = 'RegistroAlumnos';
  //Futuro para obtener lista con los registros de los alumnos que han ido al baño
  Future<List<Registro>> getRegistrosTotalesPorAlumno(alumno) async {
    final url = Uri.https(
        _url,
        '/macros/s/AKfycbyHKZtr_hYBdERlZ7PVKolf2OfB0Bpg77nENUkLZdh7CNnDg-SqmZFf-SYonKfBths9Ag/exec',
        {
          'spreadsheetId': _spreadsheetId,
          'sheet': _sheet,
          //Nombre alumno
          'alumno': alumno,
        });

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    final registro = new Informes.fromJsonList(decodeData);

    //print(registro.lista);
    //print('--------------------');
    //print(registro.resultunico);
    //print('--------------------');

    return registro.items;
  }
}
