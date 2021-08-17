import 'package:flutter/material.dart';
import 'package:ubikat/src/components/fondoApp.dart';
import 'package:ubikat/src/providers/db_provider.dart';
import 'package:ubikat/src/utils/icono_string_util.dart';


// ignore: camel_case_types
class editButtonPage extends StatefulWidget {
  const editButtonPage({ Key? key }) : super(key: key);

  @override
  _editButtonPageState createState() => _editButtonPageState();
}

// ignore: camel_case_types
class _editButtonPageState extends State<editButtonPage> {
  String _nombreBoton = "";
  String _mensaje = "";
  IconData _iconoInput =  Icons.lightbulb;
  bool _focusName = false;
  bool _focusMessage = false;
  Color _colorContainerIcono = Color.fromRGBO(90, 108, 191, 1.0);
  Color _colorIcono = Colors.pinkAccent;
  List<IconData> _listaIcons1 = [
    (Icons.car_rental),
    (Icons.food_bank_outlined),
    (Icons.lightbulb),
    (Icons.cloud_queue),
    (Icons.clean_hands),
    (Icons.add_shopping_cart_sharp),
    (Icons.airplanemode_active_rounded),
    (Icons.bolt),
    (Icons.call_end_rounded),
    (Icons.house_sharp),
    (Icons.wine_bar),
    (Icons.wc),
    (Icons.volunteer_activism),
    (Icons.videocam),
    (Icons.cake_rounded),
    (Icons.face_retouching_natural),
    (Icons.build_sharp),
    (Icons.bus_alert),
    (Icons.add_a_photo_rounded),
    (Icons.add_call),
  ];
  @override
  Widget build(BuildContext context) {
    final _bt =ModalRoute.of(context)!.settings.arguments as Boton;
    final int? _gpsId = _bt.gpsId;
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
                _titulos(_bt),
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
            "Añadir",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          onPressed: () async {
            _bt.nombre = _nombreBoton;
            _bt.mensaje = _mensaje;
            _bt.gpsId = _gpsId;
            _bt.icono =getIconToString(_iconoInput);
            await DBProvider.db.updateBoton(_bt);
            Navigator.pushNamed(context, "gpsDetails",arguments: _bt.gpsId);
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

  Widget _titulos(_bt) {
    return SafeArea(
        child: Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Editando boton: ${_bt.nombre}",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Mensaje : ${_bt.mensaje}",
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
            textCapitalization: TextCapitalization.words,
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
            textCapitalization: TextCapitalization.words,
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
}
