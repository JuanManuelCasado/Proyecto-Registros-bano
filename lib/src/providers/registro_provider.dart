import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_seneca/src/models/registros_bano_model.dart';

class InformeProvider {
  String _spreadsheetId = '1zKQfM6XjYx-hW7YiSk55YT5r66nxWSG65b_steLwd0c';
  String _url = 'script.google.com';
  String _sheet = 'RegistroAlumnos';
  //Futuro para obtener lista con los registros de los alumnos que han ido al baño
  Future<List<String>> getRegistros(start, end) async {
    final url = Uri.https(
        _url,
        'macros/s/AKfycbzt5VxwE2yAj97xu6x9iKspWMC6JC88F0Xhi0lWJ8yOm_9kCSsEq9z6n79qNucYXeD39Q/exec',
        {
          'spreadsheetId': _spreadsheetId,
          'sheet': _sheet,
          //Pasamos las cadenas con los días de inicio y fin del intervalo que queremos mostrar los registros
          'fechaInicio': start,
          'fechaFin': end,
        });

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    //print('-------------------------------------');
    //print('Inicio:' + start + '   Fin:' + end);
    //print('-------------------------------------');
    //print(decodeData);

    final registro = new Informes.fromJsonList(decodeData);

    //print(registro.lista);
    //print('--------------------');
    //print(registro.resultunico);
    //print('--------------------');

    return registro.resultunico;
  }
}
