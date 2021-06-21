import 'package:flutter/material.dart';
import 'package:prueba_seneca/src/models/registros_bano_model.dart';
import 'package:prueba_seneca/src/providers/registro_filtrado_provider.dart';

class InformesFiltradosPage extends StatelessWidget {
  final InformeFiltradoProvider registro = new InformeFiltradoProvider();

  @override
  Widget build(BuildContext context) {
    final argumento = ModalRoute.of(context).settings.arguments.toString();
    int divisor = argumento.indexOf('.');
    String nombre = argumento.substring(0, divisor);
    String argumento2 = argumento.substring(divisor + 1);
    int divisor2 = argumento2.indexOf('.');
    String curso = argumento2.substring(0, divisor2);
    String argumento3 = argumento2.substring(divisor2 + 1);
    int divisor3 = argumento3.indexOf('.');
    String fechaInicio = argumento3.substring(0, divisor3);
    String fechaFin = argumento3.substring(divisor3 + 1);

    return Scaffold(
      appBar: AppBar(
        title: Text('Alumno: ' + nombre + '       Curso: ' + curso),
      ),
      body: FutureBuilder(
        //Le pasamos los parámetros para filtrar los registros de nuestra hoja de cálculo
        future: registro.getRegistrosFiltrados(nombre, fechaInicio, fechaFin),
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
