import 'package:flutter/material.dart';
import 'package:prueba_seneca/src/pages/calendario_page.dart';
import 'package:prueba_seneca/src/pages/cursos_page.dart';
import 'package:prueba_seneca/src/pages/registros_barra_filtro.dart';

import 'loggin_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Inicio',
    ),
  ];

  void _onItemTipped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final LogginPageState args = new LogginPageState();

    return Scaffold(
        body: Stack(
      children: <Widget>[
        _widgetOptions.elementAt(_selectedIndex),
        _titulo(widht, height),
        _tarjeta(widht, height, args),
        _tabla(widht, height),
      ],
    ));
    //bottomNavigationBar: _barraNavegacion());
  }

  Widget _titulo(widht, height) {
    return Container(
      padding: EdgeInsets.only(top: 45.0),
      color: Colors.blue[800],
      height: height * 0.2,
      width: widht,
      child: Text(
        'iSéneca',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _tarjeta(widht, height, args) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: height * 0.55,
      width: widht * 0.95,
      child: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Casado Maldonado, Juan Manuel',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(width: 110.0),
                  IconButton(
                      icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                      onPressed: () {}),
                  Icon(Icons.people, color: Colors.black),
                  SizedBox(width: 10.0),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 240.0,
                ),
                child: Text(
                  'IES Jándula',
                  style: TextStyle(
                      color: Colors.blue[700], fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 225.0,
                  top: 5.0,
                ),
                child: Text(
                  'Perfil Dirección',
                  style: TextStyle(
                      color: Colors.blue[700], fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25.0),
                color: Colors.lightBlue,
                // width: widht,
                height: height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlatButton(
                        onPressed: null,
                        child: Row(
                          children: [
                            SizedBox(width: 15.0),
                            Icon(
                              Icons.alarm,
                              color: Colors.white,
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              'Avisos',
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 10.0),
                            VerticalDivider(color: Colors.white),
                            FlatButton(
                                onPressed: null,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.library_books,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8.0),
                                    Text(
                                      'Bandeja de firmas',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                )),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabla(widht, height) {
    return Container(
      padding: EdgeInsets.only(top: 350.0),
      child: Table(
        border: TableBorder(
          verticalInside: BorderSide(
              width: 1, color: Colors.grey, style: BorderStyle.solid),
          horizontalInside: BorderSide(
              width: 1, color: Colors.grey, style: BorderStyle.solid),
        ),
        children: [
          TableRow(
            children: [
              _crearboton(Icons.school, 'Alumnado del centro'),
              _crearboton(Icons.perm_media, 'Personal del centro'),
              _crearboton(Icons.local_hospital, 'Información del covid'),
            ],
          ),
          TableRow(
            children: [
              _crearbotonRegistrosTotales(
                  Icons.assignment, 'Registros Totales'),
              _crearbotonRegistros(
                  Icons.assignment_rounded, 'Registros Filtrados'),
              _crearbotonToilet(
                  Icons.airline_seat_legroom_normal_outlined, 'Baño'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearboton(IconData icono, String texto) {
    return Container(
      height: 110.0,
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              IconButton(
                  icon: Icon(
                    icono,
                    color: Colors.lightBlue[300],
                    size: 40.0,
                  ),
                  onPressed: () {
                    //Navigator.push( context,MaterialPageRoute( builder: (context) => PersonalCentro()));
                  }),
              SizedBox(height: 10.0),
              Text(texto,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  //Widget para acceder al menu del baño
  Widget _crearbotonToilet(IconData icono, String texto) {
    return Container(
      height: 110.0,
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              IconButton(
                  icon: Icon(
                    icono,
                    color: Colors.lightBlue[300],
                    size: 40.0,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CursosPage()));
                  }),
              SizedBox(height: 10.0),
              Text(texto,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  //Widget para barra navegación homepage(opcional)
  Widget _barraNavegacion() {
    return BottomNavigationBar(
      elevation: 40.0,
      iconSize: 20.0,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            title: Text(
              'Inicio',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.schedule, color: Colors.grey),
            title: Text(
              'Agenda',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            )),
        BottomNavigationBarItem(
          icon: Icon(Icons.message, color: Colors.grey),
          title: Text(
            'Comunicaciones',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.menu, color: Colors.grey),
            title: Text(
              'Menú',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            )),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue[700],
      onTap: _onItemTipped,
    );
  }

  //Método para crear el botón de informes
  Widget _crearbotonRegistros(IconData icono, String texto) {
    return Container(
      height: 110.0,
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              IconButton(
                  icon: Icon(
                    icono,
                    color: Colors.lightBlue[300],
                    size: 40.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalendarioPage()));
                  }),
              SizedBox(height: 10.0),
              Text(texto,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

//Método para crear el botón de regisros totales
  Widget _crearbotonRegistrosTotales(IconData icono, String texto) {
    return Container(
      height: 110.0,
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              IconButton(
                  icon: Icon(
                    icono,
                    color: Colors.lightBlue[300],
                    size: 40.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrosFiltroBarra()));
                  }),
              SizedBox(height: 10.0),
              Text(texto,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}
