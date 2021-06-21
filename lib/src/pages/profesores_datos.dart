import 'package:flutter/material.dart';
import 'package:prueba_seneca/src/models/personal_centro_model.dart';
import 'package:prueba_seneca/src/providers/personal_centro_provider.dart';

class ProfesorDatos extends StatelessWidget {
  final PersonalProvider persona = new PersonalProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: persona.getPersonal(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return _ListaProfesor(snapshot.data);
          }
        },
      ),
    );
  }
}

class _ListaProfesor extends StatelessWidget {
  final List<Personal> p;

  _ListaProfesor(this.p);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: p.length,
        itemBuilder: (context, int index) {
          //final profe = p[index];
          return ListTile(
            onTap: () {
              mostrarDialogo(context, p[index]);
            },
          );
        });
  }

  mostrarDialogo(context, profe) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent),
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width * 0.4,
                height: 220,
              ),
            ),
          );
        });
  }
}
