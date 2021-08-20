import 'package:flutter/material.dart';
import 'package:ubikat/src/components/fondoApp.dart';
import 'package:ubikat/src/models/botones_model.dart';
import 'package:ubikat/src/providers/db_provider.dart';

class TabAddPage extends StatefulWidget {
  const TabAddPage({Key? key}) : super(key: key);

  @override
  _TabAddPageState createState() => _TabAddPageState();
}

class _TabAddPageState extends State<TabAddPage> {
  final  gps = new Gps();
  String _nombreGPS = "";
  String _numeroTelf ="" ;
  IconData _iconoInput = Icons.signal_cellular_alt_outlined;
  @override
  Widget build(BuildContext context) {
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
            gps.nombre=_nombreGPS;
            gps.numero=_numeroTelf;
            if( gps.nombre ==""||gps.numero ==""){
              _mostrarAlert();
            }else{
            await DBProvider.db.nuevoGps(gps);
            Navigator.pushNamed(context, 'home');}
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
          Text(
            "Cree un boton nuevo",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Personalice su boton segun la necesidad",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
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
            textCapitalization: TextCapitalization.none,
            decoration: InputDecoration(
                hoverColor: Colors.pinkAccent,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: "Nombre GSM",
                labelStyle: TextStyle(color: Colors.white),
                hintText: "Escribe el nombre del controlador GSM",
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
            textCapitalization: TextCapitalization.none,
            decoration: InputDecoration(
                hoverColor: Colors.pinkAccent,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: "Numero Telf",
                labelStyle: TextStyle(color: Colors.white),
                hintText: "Escribe el numero de la linea del controlador",
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
  _mostrarAlert() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Center(
            child: Text(
              "ERROR",
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
          content: Text(
            "Falta algun campo por completar, por favor revise el formulario",
            style: TextStyle(color: Colors.black),
          ),
        );
      },
    );
  }
}
