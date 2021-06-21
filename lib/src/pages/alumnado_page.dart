import 'package:flutter/material.dart';
import 'package:prueba_seneca/src/models/alumnos_centro_model.dart';
import 'package:prueba_seneca/src/providers/alumnos_provider.dart';

class AlumnosCentro extends StatelessWidget {
  final AlumnosProvider alumno = new AlumnosProvider();

  @override
  Widget build(BuildContext context) {
    //Cogemos el curso que hemos pasado de la pagina anterior
    final argumento = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Alumnado   ' + argumento),
      ),
      body: FutureBuilder(
        //Paso el argumento y nos cargara solo los alumnos del centro seleccionado
        future: alumno.getAlumnos(argumento),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            //Aqui ya viene la lista completa
            return ListaAlumnos(snapshot.data);
          }
        },
      ),
    );
  }
}

//Crear la lista nueva
class ListaAlumnos extends StatelessWidget {
  final List<Alumno> lisAlum;
  //Lista Entera
  ListaAlumnos(this.lisAlum);
  @override
  Widget build(
    BuildContext context,
  ) {
    //Cogemos el curso que hemos pasado

    return ListView.builder(
        itemCount: lisAlum.length,
        itemBuilder: (context, int index) {
          final alumno = lisAlum[index];
          return ListTile(
              title: Text('${alumno.alumnoA}'),
              subtitle: Text('${alumno.unidad}'),
              onTap: () {
                //Pasamos a la siguiente página el nombre del alumno y el curso
                Navigator.pushNamed(context, 'toilet',
                    arguments: ('${alumno.alumnoA}+${alumno.unidad}'));
              });
        });
  }
}
