import 'package:flutter/material.dart';
import 'package:prueba_seneca/src/models/registros_bano_model.dart';
import 'package:prueba_seneca/src/providers/registro_totales_alumno_provider.dart';
//import 'package:prueba_seneca/src/models/informes_bano_model.dart';

class RegistrosTotalesAlumnoPage extends StatelessWidget {
  final InformesTotalesAlumnoProvider registro =
      new InformesTotalesAlumnoProvider();

  @override
  Widget build(BuildContext context) {
    final argumento = ModalRoute.of(context).settings.arguments.toString();
    //Separamos los argumentos para trabajar con ellos
    List<String> datos = argumento.toString().split(".");
    String nombreAlumno = datos.elementAt(0);
    String cursoAlumno = datos.elementAt(1);

    return Scaffold(
      appBar: AppBar(
        title: Text('Alumno: ' + nombreAlumno + '       Curso: ' + cursoAlumno),
      ),
      body: FutureBuilder(
        //Le pasamos los parámetros para filtrar los registros de nuestra hoja de cálculo
        future: registro.getRegistrosTotalesPorAlumno(nombreAlumno),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return _ListaRegistrosFiltrados(snapshot.data);
          }
        },
      ),
    );
  }
}

class _ListaRegistrosFiltrados extends StatelessWidget {
  final List<Registro> lisRegistros;
  _ListaRegistrosFiltrados(this.lisRegistros);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lisRegistros.length,
        itemBuilder: (context, int index) {
          final registro = lisRegistros[index];
          return ListTile(
            title: Text('Dia/Hora:  ' +
                '${registro.diaHora}' +
                '    ' +
                '${registro.accion}'),
            onTap: () {},
          );
        });
  }
}
