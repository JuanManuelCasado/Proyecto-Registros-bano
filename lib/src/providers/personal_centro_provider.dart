import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:prueba_seneca/src/models/personal_centro_model.dart';

class PersonalProvider {
  String _spreadsheetId = '16o_ufRiLijOlW7fPrWAHbMigDDixJmvV486T3rzZOQs';
  String _url = 'script.google.com';
  String _sheet = 'personal';

  Future<List<Personal>> getPersonal() async{
    
    final url = Uri.https( _url,
        'macros/s/AKfycbyhnXYH8HFnQoTqyrYhtXJRcuM1ft271v8Au1Dy02aEP5k5xLm6/exec',{
          'spreadsheetId' : _spreadsheetId,
          'sheet' : _sheet,


        });

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    print(decodeData);

    final per = new Persona.fromJsonList(decodeData);

    return per.items;
  }
}
