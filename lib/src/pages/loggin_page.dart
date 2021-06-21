import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prueba_seneca/src/models/usuarios_model.dart';
import 'package:prueba_seneca/src/pages/home_page.dart';

import 'package:prueba_seneca/src/providers/usuarios_provider.dart';

class LogginPage extends StatefulWidget {
  @override
  LogginPageState createState() => LogginPageState();
}

class LogginPageState extends State<LogginPage> {
  final UsuariosProvider usuario = new UsuariosProvider();

  final Usuarios u = new Usuarios();

  final myController = TextEditingController();
  final myController2 = TextEditingController();

  final List<Usuarios> usuarios;

  LogginPageState({this.usuarios});

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          width: width,
          padding: EdgeInsets.only(top: 120.0),
          height: height * 10.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[600],
              Colors.blue[700],
              Colors.blue[800],
              Colors.blue[900],
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _titulo(),
              Container(width: width * 0.85, child: _textFieldUsuario()),
              SizedBox(height: 25.0),
              Container(width: width * 0.85, child: _textFieldPassword()),
              SizedBox(height: 25.0),
              Container(
                  width: width * 0.85, height: 40.0, child: _botonEntrar()),
              SizedBox(height: 25.0),
              _recordarpassword(),
              SizedBox(height: 25.0),
              _imagen(),
              _version(height),
            ],
          )),
    );
  }

  Widget _titulo() {
    return Text(
      'iSéneca',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 68.0, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _textFieldUsuario() {
    return TextField(
        controller: myController,
        decoration: InputDecoration(
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            labelText: 'Usuario',
            labelStyle: TextStyle(color: Colors.white)));
  }

  Widget _textFieldPassword() {
    return TextField(
      controller: myController2,
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        labelText: 'Contraseña',
        labelStyle: TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(Icons.remove_red_eye, color: Colors.white),
          onPressed: null,
        ),
      ),
    );
  }

  Widget _botonEntrar() {
    return FlatButton(
      color: Colors.white,
      textColor: Colors.blue,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(10.0),
      splashColor: Colors.blueAccent,
      onPressed: () {
        comprobarUsuario(context);
        //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      child: Text(
        "Entrar",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  Widget _recordarpassword() {
    return Text(
      'No recuerdo mi contraseña',
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
        decoration: TextDecoration.underline,
      ),
    );
  }

  Widget _imagen() {
    return Image.asset(
      'assets/logo-junta.png',
      width: 130.0,
      height: 180.0,
    );
  }

  Widget _version(height) {
    return Container(
      height: 16.0,
      margin: EdgeInsets.only(left: 265.0),
      child: Text('v11.3.0',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17.0)),
    );
  }

  void comprobarUsuario(BuildContext context) async {
    final usuarios = await usuario.getDatos(); //usuariosProvider lo hemos
    //definido como atributo.
    usuarios.forEach((user) {
      if (user.usuario == myController.text &&
          user.password == myController2.text)
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }
}
