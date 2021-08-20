import 'package:flutter/material.dart';
import 'package:ubikat/src/components/fondoApp.dart';

class coffePage extends StatelessWidget {
  const coffePage({Key? key}) : super(key: key);

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
                _crearTexto(),
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
            "Invitame a un cafe☕",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    ));
  }

  _crearTexto() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(right: 25.0, left: 25.0),
          child: Text(
            'Si la aplicacion te resultó util y quieres apoyar desarrollador a seguir creando apps que nos faciliten la vida puedes donar 💲 a esta trajeta: \n\n\n            💳 2222 2222 2222 2222 \n\n No importa la cantidad ,cada centavo vale la pena.De ante mano gracias por usar nuestra aplicacion la aplicacion 😊',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
