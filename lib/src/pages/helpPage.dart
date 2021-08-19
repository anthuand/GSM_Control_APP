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

  _crearAyuda() {}
}
