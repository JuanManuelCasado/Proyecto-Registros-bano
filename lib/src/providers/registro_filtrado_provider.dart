import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_seneca/src/models/registros_bano_model.dart';

class InformeFiltradoProvider {
  String _spreadsheetId = '1zKQfM6XjYx-hW7YiSk55YT5r66nxWSG65b_steLwd0c';
  String _url = 'script.google.com';
  String _sheet = 'RegistroAlumnos';
  //Futuro para obtener lista con los registros de los alumnos que han ido al baño
  Future<List<Registro>> getRegistrosFiltrados(
      nombre, fechaInicio, fechaFin) async {
    final url = Uri.https(
        _url,
        'macros/s/AKfycbyxWHWHh9NXtNoVqfirPohdq3v0e24GxB-IpSAnoYHgtCy1NHOvvXfNHnoeJOj8moDT/exec',
        {
          //Libro y Hoja
          'spreadsheetId': _spreadsheetId,
          'sheet': _sheet,
          //Filtro por alumno
          'alumno': nombre,
          //Filtro por fecha
          'fechaInicio': fechaInicio,
          'fechaFin': fechaFin
        });
    //print(url);
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    //print(decodeData);
    final registro = new Informes.fromJsonList(decodeData);

    return registro.items;
  }
}
