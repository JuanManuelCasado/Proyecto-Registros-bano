import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_seneca/src/models/cursos_centro_model.dart';

class CursosProvider {
  String _spreadsheetId = '1jgunJQNbekgH_XiwuNy9xo7plPtHwJUd9ksTgALlD9Q';
  String _url = 'script.google.com';
  String _sheet = 'Grupos';

  Future<List<Grupo>> getCursos() async {
    final url = Uri.https(
        _url,
        'macros/s/AKfycbzUHLrOSc2LizULqAOIuV_D0_RCCYJj6zizUMBUj3wJCjweemSJKacREXR3qcOA8rQ0-w/exec',
        {
          'spreadsheetId': _spreadsheetId,
          'sheet': _sheet,
        });

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    print(decodeData);

    final grupo = new Grupos.fromJsonList(decodeData);

    return grupo.items;
  }
}
