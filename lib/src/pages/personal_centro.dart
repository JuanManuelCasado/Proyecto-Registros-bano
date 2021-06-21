import 'package:flutter/material.dart';
import 'package:prueba_seneca/src/models/personal_centro_model.dart';
import 'package:prueba_seneca/src/providers/personal_centro_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalCentro extends StatelessWidget {
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
            return _ListaPersonal(snapshot.data);
          }
        },
      ),
    );
  }
}

class _ListaPersonal extends StatelessWidget {
  final List<Personal> p;

  _ListaPersonal(this.p);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: p.length,
        itemBuilder: (context, int index) {
          final profe = p[index];
          return ListTile(
            title: Text('${profe.usuario}'),
            onTap: () {
              mostrarDialogo(context, p[index]);
              //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfesorDatos()));
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
                    color: Colors.white),
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 320,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.kindpng.com/picc/m/33-338711_circle-user-icon-blue-hd-png-download.png'),
                    ),
                    ListTile(
                      title: Text(
                        '${profe.mail}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                      onTap: () {
                        launch(
                            "mailto:${profe.mail}?subject=Probando flutter&body=Hola ${profe.usuario}%20");
                      },
                    ),
                    ListTile(
                      title: Text(
                        profe.telefono,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                      onTap: () {
                        launch("tel://${profe.telefono}");
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
