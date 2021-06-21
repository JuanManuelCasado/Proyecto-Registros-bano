import 'package:flutter/material.dart';
//import 'package:prueba_seneca/src/models/registros_bano_model.dart';
//import 'package:prueba_seneca/src/models/informes_bano_model.dart';
import 'package:prueba_seneca/src/providers/registro_provider.dart';

class InformesPage extends StatelessWidget {
  final InformeProvider registro = new InformeProvider();

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context).settings.arguments.toString();
    int separador = argumentos.indexOf(';');
    String fechaInicio = argumentos.substring(0, separador);
    String fechaFin = argumentos.substring(separador + 1);

    return Scaffold(
      appBar: AppBar(
        title: Text('Periodo: ' + fechaInicio + ' ---- ' + fechaFin),
      ),
      body: FutureBuilder(
        //Le pasamos los parámetros para filtrar los registros de nuestra hoja de cálculo
        future: registro.getRegistros(fechaInicio, fechaFin),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return _ListaRegistros(snapshot.data);
          }
        },
      ),
    );
  }
}

class _ListaRegistros extends StatelessWidget {
  final List<String> lisRegistros;
  _ListaRegistros(this.lisRegistros);

  @override
  Widget build(BuildContext context) {
    //Al estar en otra clase tengo que volver a coger los argumentos
    final argumentos = ModalRoute.of(context).settings.arguments.toString();
    int separador = argumentos.indexOf(';');
    String fechaInicio = argumentos.substring(0, separador);
    String fechaFin = argumentos.substring(separador + 1);
    return ListView.builder(
        itemCount: lisRegistros.length,
        itemBuilder: (context, int index) {
          final registro = lisRegistros[index];
          int divisor = registro.indexOf(';');
          String total = registro.substring(0, divisor);
          String registro2 = registro.substring(divisor + 1);
          int divisor2 = registro2.indexOf(';');
          String nombreAlumno = registro2.substring(0, divisor2);
          String cursoAlumno = registro2.substring(divisor2 + 3);

          return ListTile(
            title: Text(total +
                ' - ' +
                'Alumno:' +
                nombreAlumno +
                '   Curso:' +
                cursoAlumno),
            onTap: () {
              Navigator.pushNamed(context, 'informes_filtrados',
                  arguments: nombreAlumno +
                      '.' +
                      cursoAlumno +
                      '.' +
                      fechaInicio +
                      '.' +
                      fechaFin);
            },
          );
        });
  }
}
