import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ubikat/src/pages/GpsDetails.dart';


import 'package:ubikat/src/pages/addButtonpage.dart';
import 'package:ubikat/src/pages/addTabpage.dart';
import 'package:ubikat/src/pages/coffePage.dart';
import 'package:ubikat/src/pages/editButtonPage.dart';
import 'package:ubikat/src/pages/editGpsPage.dart';
import 'package:ubikat/src/pages/helpPage.dart';
import 'package:ubikat/src/pages/homepage.dart';
// import 'package:ubikat/src/providers/db_provider.dart';
import 'package:ubikat/src/providers/push_notification_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // try {
    //   PushNotification.initializeApp();
    // } catch (e) {
    //   print(e);
    // }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
    ));

    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'gpsDetails': (BuildContext context) => DetallesPage(),
        'addTab': (BuildContext context) => TabAddPage(),
        'addButton': (BuildContext context) => ButtonAddPage(),
        'editGpsPage': (BuildContext context) => editGpsPage(),
        'editButtonPage': (BuildContext context) => editButtonPage(),
        'helpPage': (BuildContext context) => helpPage(),
        'coffePage': (BuildContext context) => coffePage(),
      },
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorDark: Colors.white, 
        brightness: Brightness.light,
      ),
    );
  }
}
