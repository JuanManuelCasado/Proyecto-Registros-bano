import 'package:flutter/material.dart';
import 'package:prueba_seneca/src/pages/alumnado_page.dart';
import 'package:prueba_seneca/src/pages/calendario_page.dart';
import 'package:prueba_seneca/src/pages/cursos_page.dart';
import 'package:prueba_seneca/src/pages/home_page.dart';
import 'package:prueba_seneca/src/pages/registros_barra_filtro.dart';
import 'package:prueba_seneca/src/pages/registros_barra_filtro_alumno_page.dart';
import 'package:prueba_seneca/src/pages/registros_page.dart';
import 'package:prueba_seneca/src/pages/loggin_page.dart';
import 'package:prueba_seneca/src/pages/registros_alumno_filtrado_page.dart';
import 'package:prueba_seneca/src/pages/toilet_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Séneca',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => LogginPage(),
        'homepage': (BuildContext context) => HomePage(),
        'cursos': (BuildContext context) => CursosPage(),
        'alumnos': (BuildContext context) => AlumnosCentro(),
        'toilet': (BuildContext context) => ToiletPage(),
        'calendario': (BuildContext context) => CalendarioPage(),
        'informes': (BuildContext context) => InformesPage(),
        'informes_filtrados': (BuildContext context) => InformesFiltradosPage(),
        'filtro': (BuildContext context) => RegistrosFiltroBarra(),
        'filtroAlumno': (BuildContext context) => RegistrosTotalesAlumnoPage(),
      },
    );
  }
}
