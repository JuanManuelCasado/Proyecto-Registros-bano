// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioPage extends StatefulWidget {
  @override
  _CalendarioPageState createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  CalendarController fechaInicio, fechaFin;

  @override
  void initState() {
    //Inicializamos
    super.initState();
    fechaInicio = CalendarController();
    fechaFin = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccione el periodo de fechas'),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: calendarioInicio(),
                ),
                SizedBox(
                  width: 100.0,
                ),
                Expanded(
                  child: calendariofin(),
                ),
              ],
            ),
            SizedBox(height: 50.0),
            Container(
              child: Center(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 20)),
                      onPressed: () {
                        //Formateamo la fecha incio
                        String todo1 = fechaInicio.selectedDay.toString();
                        String fechaInicioFormateada = formatearFecha(todo1);

                        String todo2 = fechaFin.selectedDay.toString();
                        String fechaFinFormateada = formatearFecha(todo2);

                        //Pasamos los parámetros formateados a la siguiente página
                        Navigator.pushNamed(context, 'informes',
                            arguments: fechaInicioFormateada +
                                ';' +
                                fechaFinFormateada);
                      },
                      child: Text('Consultar Registros'))),
            )
            //SizedBox(height: 20.0),
          ],
        )),
      ),
    );
  }

  Widget calendarioInicio() {
    return TableCalendar(
      initialCalendarFormat: CalendarFormat.month,
      calendarStyle: CalendarStyle(
          selectedColor: Theme.of(context).primaryColor,
          todayStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white)),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonDecoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20.0),
        ),
        formatButtonTextStyle: TextStyle(color: Colors.white),
        formatButtonShowsNext: false,
      ),
      //Botón de arriba de formato
      startingDayOfWeek: StartingDayOfWeek.monday,
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, events) => Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10.0)),
            child: Text(
              date.day.toString(),
              style: TextStyle(color: Colors.white),
            )),
        //Dia por defecto
        todayDayBuilder: (context, date, events) => Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10.0)),
            child: Text(
              date.day.toString(),
              style: TextStyle(color: Colors.black),
            )),
      ),
      calendarController: fechaInicio,
    );
  }

  Widget calendariofin() {
    return TableCalendar(
      initialCalendarFormat: CalendarFormat.month,
      calendarStyle: CalendarStyle(
          selectedColor: Theme.of(context).primaryColor,
          todayStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white)),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonDecoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20.0),
        ),
        formatButtonTextStyle: TextStyle(color: Colors.white),
        formatButtonShowsNext: false,
      ),
      startingDayOfWeek: StartingDayOfWeek.monday,
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, events) => Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10.0)),
            child: Text(
              date.day.toString(),
              style: TextStyle(color: Colors.white),
            )),
        todayDayBuilder: (context, date, events) => Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10.0)),
            child: Text(
              date.day.toString(),
              style: TextStyle(color: Colors.black),
            )),
      ),
      calendarController: fechaFin,
    );
  }

  formatearFecha(String todo) {
    int separadorFechaHora = todo.indexOf(' ');
    String diaInicio = todo.substring(0, separadorFechaHora);
    int separaAno = diaInicio.indexOf('-');
    String ano = diaInicio.substring(0, separaAno);
    String mesDia = diaInicio.substring(separaAno + 1);
    int separaMes = mesDia.indexOf('-');
    String mes = mesDia.substring(0, separaMes);
    String dia = mesDia.substring(separaMes + 1);
    String fechaFormateada = dia + '/' + mes + '/' + ano;
    return fechaFormateada;
  }
}
