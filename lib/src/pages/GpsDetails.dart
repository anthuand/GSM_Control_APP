import 'package:flutter/material.dart';

import 'package:sms_advanced/sms_advanced.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

import 'package:ubikat/src/components/bottomNavigationBar.dart';
import 'package:ubikat/src/components/fondoApp.dart';
import 'package:ubikat/src/providers/db_provider.dart';
import 'package:ubikat/src/utils/icono_string_util.dart';

class DetallesPage extends StatefulWidget {
  const DetallesPage({Key? key}) : super(key: key);

  @override
  _DetallesPageState createState() => _DetallesPageState();
}

class _DetallesPageState extends State<DetallesPage> {
  @override
  Widget build(BuildContext context) {
    SmsSender sender = new SmsSender();
    final int? gpsId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: Container(
        child: _crearHomeMain(gpsId, sender),
      ),
      bottomNavigationBar: BottomBarNav(),
    );
  }

  Widget _titulos(gpsId) {
    print("ESte es el id $gpsId");
    return FutureBuilder(
      future: DBProvider.db.getGpsId(gpsId as int),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return SafeArea(
              child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  height: 40.0,
                  child: CircularProgressIndicator()));
        }
        Gps gps = snapshot.data;
        return SafeArea(
            child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Control de :${gps.nombre}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  "Telefono:${gps.numero}",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ],
          ),
        ));
      },
    );
  }

  Widget _crearHomeMain(gpsId, sender) {
    return Stack(
      children: [
        FondoApp(),
        SingleChildScrollView(
          child: Column(
            children: [
              _titulos(gpsId),
              _crearRows(gpsId, sender),
              _botonAdd(gpsId)
            ],
          ),
        )
      ],
    );
  }

  Widget _crearRows(gpsId, sender) {
    return FutureBuilder(
      future: DBProvider.db.getbotonesPorGpsId(gpsId as int),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        List<Widget> rows = [];
        // ignore: non_constant_identifier_names
        List<Boton> BotonList = snapshot.data;
        print(BotonList);
        int cantBoton = BotonList.length;
        bool esPar = false;
        int cantRows;

        if (cantBoton % 2 == 0) {
          esPar = true;
          cantRows = cantBoton ~/ 2;
          print('La cantidad de Boton es par');
          rows = _crearRowsItems(
              BotonList, cantBoton, cantRows, esPar, gpsId, sender);
          return Column(
            children: rows,
          );
        }
        cantBoton++;
        cantRows = cantBoton ~/ 2;
        print('La cantidad de Boton es impar');
        rows = _crearRowsItems(
            BotonList, cantBoton, cantRows, esPar, gpsId, sender);
        return Column(
          children: rows,
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  List<Widget> _crearRowsItems(List<Boton> BotonList, int cantBoton,
      int cantRows, bool esPar, gpsId, sender) {
    List<Widget> rows = [];
    print("Cantidad de Boton : $cantBoton");
    print("Cantidad de rows : $cantRows \n\n");
    int count = 0;

    if (!esPar) {
      for (var i = 0; i < cantRows - 1; i++) {
        print("Fila #$i");
        rows.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _crearBoton(BotonList[count], gpsId, sender),
            _crearBoton(BotonList[count + 1], gpsId, sender),
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
          _crearBoton(BotonList[BotonList.length - 1], gpsId, sender),
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
            _crearBoton(BotonList[count], gpsId, sender),
            _crearBoton(BotonList[count + 1], gpsId, sender),
          ],
        ));
        count += 2;
      }
    }

    return rows;
  }

  // ignore: non_constant_identifier_names
  _crearBoton(Boton Boton, gpsId, sender) {
    print("Boton: ${Boton.nombre} Mensaje: ${Boton.mensaje}\n");
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
                      _mostrarAlert(context, Boton, gpsId);
                    },
                    icon: Icon(Icons.close, color: Colors.white70)),
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              radius: 35.0,
              child: Icon(
                getIcon(Boton.icono as String),
                color: Colors.white,
                size: 50.0,
              ),
            ),
            Text(Boton.nombre as String,
                style: TextStyle(color: Colors.pinkAccent)),
            // Text(Boton.mensaje as String,
            //     style: TextStyle(color: Colors.pinkAccent)),
            SizedBox(
              height: 5.0,
            )
          ],
        ),
      ),
      onTap: () async {
        Gps? gps = await DBProvider.db.getGpsId(gpsId);
        String? address = gps!.numero;
        String? menssage =Boton.mensaje;
        if(menssage == null ){menssage=" ";}
        try {
          sender.sendSms(new SmsMessage(address, menssage));
          FlutterToastr.show("Se envio el mensaje", context,
              duration: FlutterToastr.lengthShort,
              position: FlutterToastr.bottom);
        } catch (e) {
          print(e);
        }
      },
      onDoubleTap: () {
        Navigator.pushNamed(context, 'editButtonPage', arguments: Boton);
      },
    );
  }

  _botonAdd(gpsId) {
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
                Navigator.pushNamed(context, 'addButton', arguments: gpsId);
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

  void _mostrarAlert(BuildContext context, Boton bt, gpsId) {
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
            "Esta seguro de que desea eliminar este boton",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              child: Text("Cancelar", style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.pushNamed(context, 'gpsDetails', arguments: gpsId);
                FlutterToastr.show("Se canceló la acción", context,
                    duration: FlutterToastr.lengthShort,
                    position: FlutterToastr.bottom);
              },
            ),
            TextButton(
              child: Text("Aceptar", style: TextStyle(color: Colors.black)),
              onPressed: () async {
                await DBProvider.db.deleteBoton(bt.id as int);
                Navigator.pushNamed(context, 'gpsDetails', arguments: gpsId);
                FlutterToastr.show("Se elimino el Boton", context,
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
