import 'package:flutter/material.dart';
import 'dart:math';

class FondoApp extends StatelessWidget {
  const FondoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.6),
            end: FractionalOffset(0.0, 1.0),
            colors: [
              Color.fromRGBO(52, 54, 101, 1.0),
              Color.fromRGBO(35, 37, 57, 1.0),
            ]),
      ),
    );
    // ignore: non_constant_identifier_names
    final CajaRosada = Transform.rotate(
      angle: -pi / 4.0,
      child: Container(
        width: 360.0,
        height: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
                Color.fromRGBO(236, 98, 188, 1.0),
                Color.fromRGBO(241, 142, 172, 1.0),
              ]),
        ),
      ),
    );

    return Stack(
      children: [
        gradiente,
        Positioned(
          child: CajaRosada,
          top: -100.0,
        )
      ],
    );
  }
}
