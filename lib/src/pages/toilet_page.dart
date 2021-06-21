// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToiletPage extends StatefulWidget {
  @override
  _ToiletPageState createState() => _ToiletPageState();
}

class _ToiletPageState extends State<ToiletPage> {
  //Inicializar botones
  List<bool> _list = [true, false];
  //Controlamos el estado de los botones
  bool ignoring = false;
  void setIgnoring(bool newValue) {
    setState(() {
      ignoring = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Cogemos el curso que hemos pasado
    final String argumentos = ModalRoute.of(context).settings.arguments;
    //Separamos los argumentos para trabajar con ellos
    List<String> datos = argumentos.toString().split("+");
    String nombreAlumno = datos.elementAt(0);
    String cursoAlumno = datos.elementAt(1);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(nombreAlumno),
        ),
        body: Center(
          child: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 150.0,
                    height: 70.0,
                    child: IgnorePointer(
                      ignoring: ignoring,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                _list[0] ? Colors.blue : Colors.grey,
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              _list[0] = !_list[0];
                              _list[1] = !_list[1];
                            });
                            setIgnoring(!ignoring);
                            String salida = 'salir';
                            http.get(
                                'https://script.google.com/macros/s/AKfycbxF1yI7rZoZw1OAvY0ife7svYGondEl0aVH70Bnfa2eOPD2IyD2cmqitf24vzQSxFKBYw/exec?alumno=' +
                                    nombreAlumno +
                                    '&curso=' +
                                    cursoAlumno +
                                    '&accion=Salida');
                            crearDialogo(nombreAlumno, salida);
                          },
                          child: Text('Salir',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                              ))),
                    ),
                  ),
                  Container(
                    width: 150.0,
                    height: 70.0,
                    child: IgnorePointer(
                      ignoring: !ignoring,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                _list[1] ? Colors.blue : Colors.grey,
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              _list[0] = !_list[0];
                              _list[1] = !_list[1];
                            });
                            setIgnoring(!ignoring);
                            String vuelta = 'volver';
                            http.get(
                                'https://script.google.com/macros/s/AKfycbxF1yI7rZoZw1OAvY0ife7svYGondEl0aVH70Bnfa2eOPD2IyD2cmqitf24vzQSxFKBYw/exec?alumno=' +
                                    nombreAlumno +
                                    '&curso=' +
                                    cursoAlumno +
                                    '&accion=Vuelta');
                            crearDialogoVuelta(
                                nombreAlumno, cursoAlumno, vuelta);
                          },
                          child: Text('Volver',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                              ))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  //Método para crear el diálogo pasandole el nombre del alumno y la accion
  crearDialogo(String nombreAlumno, String accion) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registro Grabado'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(nombreAlumno + ' acaba de ' + accion + '.'),
                Text('Se ha guardado el registro!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Volver'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Diálogo que te devuelve al listado de alumnos de curso del que se había seleccionado alumno
  crearDialogoVuelta(String nombreAlumno, String cursoAlumno, String accion) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registro Grabado'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(nombreAlumno + ' acaba de ' + accion + '.'),
                Text('Se ha guardado el registro!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Volver'),
              onPressed: () {
                Navigator.pushNamed(context, 'homepage');
              },
            ),
          ],
        );
      },
    );
  }
}
