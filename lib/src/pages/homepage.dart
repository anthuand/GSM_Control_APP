import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

import 'package:ubikat/src/components/bottomNavigationBar.dart';
import 'package:ubikat/src/components/fondoApp.dart';
import 'package:ubikat/src/providers/db_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _crearHomeMain(),
      ),
      bottomNavigationBar: BottomBarNav(),
    );
  }

  Widget _titulos() {
    return SafeArea(
        child: Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Controle sus GPS",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text(
              "Añada nuevos Gps",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _crearHomeMain() {
    return Stack(
      children: [
        FondoApp(),
        SingleChildScrollView(
          child: Column(
            children: [_titulos(), _crearRows(), _botonAdd()],
          ),
        )
      ],
    );
  }

  Widget _crearRows() {
    return FutureBuilder(
      future: DBProvider.db.getTodosGPS(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        List<Widget> rows = [];
        List<Gps> gpsList = snapshot.data;
        print(gpsList);
        int cantGps = gpsList.length;
        bool esPar = false;
        int cantRows;

        if (cantGps % 2 == 0) {
          esPar = true;
          cantRows = cantGps ~/ 2;
          print('La cantidad de Gps es par');
          rows = _crearRowsItems(gpsList, cantGps, cantRows, esPar);
          return Column(
            children: rows,
          );
        }
        cantGps++;
        cantRows = cantGps ~/ 2;
        print('La cantidad de Gps es impar');
        rows = _crearRowsItems(gpsList, cantGps, cantRows, esPar);
        return Column(
          children: rows,
        );
      },
    );
  }

  List<Widget> _crearRowsItems(
      List<Gps> gpsList, int cantGps, int cantRows, bool esPar) {
    List<Widget> rows = [];
    print("Cantidad de gps : $cantGps");
    print("Cantidad de rows : $cantRows \n\n");
    int count = 0;

    if (!esPar) {
      for (var i = 0; i < cantRows - 1; i++) {
        print("Fila #$i");
        rows.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 20.0,
            ),
            _crearBoton(gpsList[count]),
            _crearBoton(gpsList[count + 1]),
          ],
        ));
        count += 2;
      }
      print("este es el final count $count");
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20.0,
          ),
          _crearBoton(gpsList[gpsList.length - 1]),
        ],
      ));
    } else {
      for (var i = 0; i < cantRows; i++) {
        print("Fila #$i");
        rows.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 20.0,
            ),
            _crearBoton(gpsList[count]),
            _crearBoton(gpsList[count + 1]),
          ],
        ));
        count += 2;
      }
    }

    return rows;
  }

  _crearBoton(Gps gps) {
    print("Gps ${gps.nombre} Numero:${gps.numero}\n");
    return GestureDetector(
      child: Container(
        height: 180.0,
        width: 150.0,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () async {
                      _mostrarAlert(context, gps);
                    },
                    icon: Icon(Icons.close, color: Colors.white70)),
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              radius: 35.0,
              child: Icon(
                Icons.gps_fixed_outlined,
                color: Colors.white,
                size: 50.0,
              ),
            ),
            Text(gps.nombre as String,
                style: TextStyle(color: Colors.pinkAccent)),
            Text(gps.numero as String,
                style: TextStyle(color: Colors.pinkAccent)),
            // SizedBox(
            //   height: 5.0,
            // ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'gpsDetails', arguments: gps.id as int);
      },
      onDoubleTap: (){
        Navigator.pushNamed(context, 'editGpsPage', arguments: gps);
      },
    );
  }

  _botonAdd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 20.0,
        ),
        Container(
            height: 180.0,
            width: 150.0,
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'addTab');
              },
              icon: Icon(
                Icons.add,
                size: 50.0,
              ),
              color: Colors.white,
            ))
      ],
    );
  }

  void _mostrarAlert(BuildContext context, Gps gps) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Center(
            child: Text(
              "ELIMINAR",
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
          content: Text(
            "Esta seguro de que desea eliminar este Gps",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              child: Text("Cancelar", style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.pushNamed(context, 'home');
                FlutterToastr.show("Se canceló la acción", context,
                    duration: FlutterToastr.lengthShort,
                    position: FlutterToastr.bottom);
              },
            ),
            TextButton(
              child: Text("Aceptar", style: TextStyle(color: Colors.black)),
              onPressed: () async {
                await DBProvider.db.deleteGps(gps.id as int);
                await DBProvider.db.deleteAllButtonsByGpsId(gps.id as int);
                Navigator.pushNamed(context, 'home');
                FlutterToastr.show("Se elimino el Gps", context,
                    duration: FlutterToastr.lengthShort,
                    position: FlutterToastr.bottom);
              },
            ),
          ],
        );
      },
    );
  }
}

