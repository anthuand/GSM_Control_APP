import 'package:flutter/material.dart';


import 'package:ubikat/src/components/fondoApp.dart';
import 'package:ubikat/src/models/botones_model.dart';
import 'package:ubikat/src/providers/db_provider.dart';

// ignore: camel_case_types
class editGpsPage extends StatefulWidget {
  const editGpsPage({ Key? key }) : super(key: key);

  @override
  _editGpsPageState createState() => _editGpsPageState();
}

// ignore: camel_case_types
class _editGpsPageState extends State<editGpsPage> {
  final  gps = new Gps();
  String _nombreGPS = "";
  String _numeroTelf ="" ;
  IconData _iconoInput = Icons.gps_not_fixed_outlined;


  @override
  Widget build(BuildContext context) {
    final Gps? gps = ModalRoute.of(context)!.settings.arguments as Gps ;
    // _nombreGPS= gps!.nombre!;
    // _numeroTelf=gps.numero!;
    return Scaffold(
      body: Stack(
        children: [
          FondoApp(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                _titulos(),
                _crearMainButton(),
                SizedBox(
                  height: 30.0,
                ),
                _crearFormulario(),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(55, 57, 84, 1.0),
        child: TextButton(
          child: Text(
            "Añadir",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          onPressed: ()async {
            gps!.nombre=_nombreGPS;
            gps.numero=_numeroTelf;
            await DBProvider.db.updateGps(gps);
            Navigator.pushNamed(context, 'home');
          },
        ),
      ),
    );
  }

  Widget _crearMainButton() {
    return Container(
      height: 180.0,
      width: 150.0,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 5.0,
          ),
          CircleAvatar(
            backgroundColor: Colors.pinkAccent,
            radius: 35.0,
            child: Icon(
              _iconoInput,
              color: Colors.white,
              size: 50.0,
            ),
          ),
          Text("$_nombreGPS", style: TextStyle(color: Colors.pinkAccent)),
          Text("$_numeroTelf", style: TextStyle(color: Colors.pinkAccent)),
          SizedBox(
            height: 5.0,
          )
        ],
      ),
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
              "Editar  Gps",
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
              "Actualice los datos de su Gps",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _crearFormulario() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
            cursorColor: Colors.pinkAccent,
            autofocus: false,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
                hoverColor: Colors.pinkAccent,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: "Nombre GPS",
                labelStyle: TextStyle(color: Colors.white),
                hintText: "Escribe el nombre del GPS",
                hintStyle: TextStyle(color: Colors.white)),
            onChanged: (valor) => setState(() {
              _nombreGPS = valor;
            }),
          ),
          SizedBox(
            height: 35.0,
          ),
          TextField(
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
            cursorColor: Colors.pinkAccent,
            autofocus: false,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
                hoverColor: Colors.pinkAccent,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: "Numero Telf",
                labelStyle: TextStyle(color: Colors.white),
                hintText: "Escribe el numero de la linea del gps",
                hintStyle: TextStyle(color: Colors.white)),
            onChanged: (valor) => setState(() {
              _numeroTelf = valor ;
            }),
          ),
          SizedBox(
            height: 35.0,
          ),
        ],
      ),
    );
  }
}

