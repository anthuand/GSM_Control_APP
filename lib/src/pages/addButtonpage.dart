import 'package:flutter/material.dart';

import 'package:ubikat/src/components/fondoApp.dart';
import 'package:ubikat/src/models/botones_model.dart';
import 'package:ubikat/src/providers/db_provider.dart';
import 'package:ubikat/src/utils/icono_string_util.dart';

class ButtonAddPage extends StatefulWidget {
  const ButtonAddPage({Key? key}) : super(key: key);

  @override
  _ButtonAddPageState createState() => _ButtonAddPageState();
}

class _ButtonAddPageState extends State<ButtonAddPage> {
  
  final _bt =new Boton();
  String _nombreBoton = "";
  String _mensaje = "";
  bool _focusName = false;
  bool _focusMessage = false;
  IconData _iconoInput =  Icons.lightbulb;
  Color _colorContainerIcono = Color.fromRGBO(90, 108, 191, 1.0);
  Color _colorIcono = Colors.pinkAccent;
  List<IconData> _listaIcons1 = [
    (Icons.car_rental),
    (Icons.electric_rickshaw),
    (Icons.lightbulb),
    (Icons.cloud_queue),
    (Icons.electric_bike),
    (Icons.electric_scooter),
    (Icons.airplanemode_active_rounded),
    (Icons.electrical_services_sharp),
    (Icons.tv_outlined),
    (Icons.house_sharp),
    (Icons.access_alarm),
    (Icons.local_play),
    (Icons.radio),
    (Icons.videocam),
    (Icons.cell_wifi),
    (Icons.door_front),
    (Icons.build_sharp),
    (Icons.bus_alert),
    (Icons.add_a_photo_rounded),
    (Icons.add_call),
  ];
  @override
  Widget build(BuildContext context) {
    final int? _gpsId = ModalRoute.of(context)!.settings.arguments as int;
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
                _crearIconList(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(55, 57, 84, 1.0),
        child: TextButton(
          child: Text(
            "A??adir",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          onPressed: () async {
            _bt.nombre = _nombreBoton;
            _bt.mensaje = _mensaje;
            _bt.gpsId = _gpsId;
            _bt.icono =getIconToString(_iconoInput);
            if(_bt.mensaje ==""  || _bt.nombre =="" ){
              _mostrarAlert();
            }else{
              await DBProvider.db.nuevoBoton(_bt);
            Navigator.pushNamed(context, "gpsDetails",arguments: _bt.gpsId);
            }
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
          Text("$_nombreBoton", style: TextStyle(color: Colors.pinkAccent)),
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
            autofocus: _focusName,
            textCapitalization: TextCapitalization.none,
            decoration: InputDecoration(
                hoverColor: Colors.pinkAccent,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: "Nombre Boton",
                labelStyle: TextStyle(color: Colors.white),
                hintText: "Escribe el nombre del boton",
                hintStyle: TextStyle(color: Colors.white)),
            onChanged: (valor) => setState(() {
              _nombreBoton = valor;
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
            autofocus: _focusMessage,
            textCapitalization: TextCapitalization.none,
            decoration: InputDecoration(
                hoverColor: Colors.pinkAccent,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                labelText: "Mensaje",
                labelStyle: TextStyle(color: Colors.white),
                hintText: "Escribe el mensaje a enviar",
                hintStyle: TextStyle(color: Colors.white)),
            onChanged: (valor) => setState(() {
              _mensaje = valor;
            }),
          ),
        ],
      ),
    );
  }

  Widget _crearIconList() {
    return Table(
      children: [
        _crearRow(_listaIcons1.sublist(0, 5)),
        _crearRow(_listaIcons1.sublist(5, 10)),
        _crearRow(_listaIcons1.sublist(10, 15)),
        _crearRow(_listaIcons1.sublist(15)),
      ],
    );
  }

  List<SizedBox> _crearItem(List<IconData> listaIconos) {
    Color color = Colors.transparent;
    Color colorIcono = Theme.of(context).primaryColor;
    List<SizedBox> _columnas = [];
    listaIconos.forEach((element) {
      if (_iconoInput == element) {
        color = _colorContainerIcono;
        colorIcono = _colorIcono;
      } else {
        color = Colors.transparent;
        colorIcono = Theme.of(context).primaryColor;
      }
      _columnas.add(
        SizedBox(
          width: 15.0,
          height: 50.0,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: IconButton(
              icon: Icon(
                element,
                color: colorIcono,
              ),
              onPressed: () {
                setState(() {
                  _iconoInput = element;
                  _colorContainerIcono = Theme.of(context).primaryColor;
                  _colorIcono = Colors.pinkAccent;
                });
              },
            ),
          ),
        ),
      );
    });
    return _columnas;
  }

  _crearRow(List<IconData> listaIconos) {
    return TableRow(
      children: _crearItem(listaIconos),
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
