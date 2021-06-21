import 'package:flutter/material.dart';
import 'package:prueba_seneca/src/models/cursos_centro_model.dart';
import 'package:prueba_seneca/src/providers/cursos_provider.dart';

class CursosPage extends StatelessWidget {
  final CursosProvider grupo = new CursosProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cursos del Centro'),
      ),
      body: FutureBuilder(
        future: grupo.getCursos(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return _ListaGrupos(snapshot.data);
          }
        },
      ),
    );
  }
}

class _ListaGrupos extends StatelessWidget {
  final List<Grupo> lisCursos;

  _ListaGrupos(this.lisCursos);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lisCursos.length,
        itemBuilder: (context, int index) {
          final curso = lisCursos[index];
          return ListTile(
            title: Text('${curso.cursos}'),
            onTap: () {
              //Navigator.push(context,MaterialPageRoute(builder: (context) => AlumnosCentro()));
              Navigator.pushNamed(context, 'alumnos',
                  arguments: '${curso.cursos}');
            },
          );
        });
  }
}
