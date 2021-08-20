import 'package:flutter/material.dart';
import 'package:ubikat/src/components/fondoApp.dart';

class helpPage extends StatefulWidget {
  const helpPage({ Key? key }) : super(key: key);

  @override
  _helpPageState createState() => _helpPageState();
}

class _helpPageState extends State<helpPage> {
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
                SizedBox(
                  height: 30.0,
                ),
                _crearAyuda(),

              ],
            ),
          )
        ],
      ),
      // bottomNavigationBar: ,
    );
  }


  
  Widget _titulos() {
    return SafeArea(
        child: Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 45.0,
          ),
          Text(
            "Ayuda!",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50.0),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    ));
  }

  _crearAyuda() {
    return Column(children: [
      Container(
        padding: EdgeInsets.only(right:25.0, left: 25.0),
        child: Text(
          'Esta app fue desarrollada con el objetivo de administrar controladores GSM , estos pueden integrarse en varios lugares del hogar , permitiendo un control inteligente de los electrodomesticos del hogar , entre otras muchas funciones.\n\nComo usar esta app:\n   1-Tocar el signo de agragar en la pantalla principal para crear una instancia del controlador. \n  2-Tocar el boton creado anteriormente y crear botones personalizados con nombre y mensaje. \n\n Nota: Para editar cualquier boton basta con realizar un double tap sobre ellos. \n\n Aunque esta app se creo para los controladores gps , pude ser usada en muchas mas tareas, ponga a volar su imaginacion y automatice sus tareas cotidianas😎.',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
          textAlign: TextAlign.justify,
        ),
      ),
    ],);
  }
}



