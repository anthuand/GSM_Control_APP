import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:ubikat/src/models/botones_model.dart';
export 'package:ubikat/src/models/botones_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final dbPath = await getDatabasesPath();
    print(dbPath);
    final path = join(documentsDirectory.path, 'GpsDB.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $gps (id INTEGER PRIMARY KEY AUTOINCREMENT,nombre TEXT NOT NULL,numero TEXT NOT NULL);");
      await db.execute(
          "CREATE TABLE $botones(id INTEGER PRIMARY KEY AUTOINCREMENT,gpsId INTEGER NOT NULL,nombre TEXT NOT NULL,mensaje TEXT NOT NULL,icono TEXT NOT NULL);");
    });
  }

  //************************************CRUD GPS*****************************/
  //CREAR REGISTROS
  cantidadGps() async {
    final db = await database;
    final res = await db!.rawQuery("SELECT count(*) FROM GPS");
    return res;
  }

  nuevoGps(Gps gps) async {
    final db = await database;
    final res = await db!.insert(('GPS'), gps.toJson());
    return res;
  }

  //SELECT - Obtener Informacion
  Future<Gps?> getGpsId(int id) async {
    final db = await database;
    final res = await db!.query('GPS', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Gps.fromJson(res.first) : null;
  }

  Future<List<Gps>> getTodosGPS() async {
    final db = await database;
    final res = await db!.query('GPS');

    List<Gps> list =
        res.isNotEmpty ? res.map((e) => Gps.fromJson(e)).toList() : [];

    return list;
  }

  Future<List<Gps>> getGPSPorNombre(String nombre) async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM GPS WHERE nombre='$nombre'");

    List<Gps> list =
        res.isNotEmpty ? res.map((e) => Gps.fromJson(e)).toList() : [];
    return list;
  }

  //ACTUALIZAR REGISTROS
  Future<int> updateGps(Gps gps) async {
    final db = await database;
    final res = await db!
        .update('GPS', gps.toJson(), where: 'id = ?', whereArgs: [gps.id]);
    return res;
  }
  //ELIMINAR REGISTROS

  Future<int> deleteGps(int id) async {
    final db = await database;
    final res = await db!.delete('GPS', where: 'id =?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllGps() async {
    final db = await database;
    final res = await db!.delete('GPS');
    return res;
  }

  //************************************CRUD Boton*****************************/
  //CREAR REGISTROS
  nuevoBoton(Boton bt) async {
    final db = await database;
    final res = await db!.insert(('botones'), bt.toJson());
    return res;
  }

  //SELECT - Obtener Informacion
  Future<Boton?> getBotonId(int id) async {
    final db = await database;
    final res = await db!.query('botones', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Boton.fromJson(res.first) : null;
  }

  Future<List<Boton>> getTodosbotones() async {
    final db = await database;
    final res = await db!.query('botones');

    List<Boton> list =
        res.isNotEmpty ? res.map((e) => Boton.fromJson(e)).toList() : [];

    return list;
  }

  Future<List<Boton>> getbotonesPorGpsId(int gpsId) async {
    final db = await database;
    final res =
        await db!.rawQuery("SELECT * FROM botones WHERE gpsId='$gpsId'");

    List<Boton> list =
        res.isNotEmpty ? res.map((e) => Boton.fromJson(e)).toList() : [];
    return list;
  }

  //ACTUALIZAR REGISTROS
  Future<int> updateBoton(Boton bt) async {
    final db = await database;
    final res = await db!
        .update('botones', bt.toJson(), where: 'id = ?', whereArgs: [bt.id]);
    return res;
  }
  //ELIMINAR REGISTROS

  Future<int> deleteBoton(int id) async {
    final db = await database;
    final res = await db!.delete('botones', where: 'id =?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllButtons() async {
    final db = await database;
    final res = await db!.delete('botones');
    return res;
  }

  Future<int> deleteAllButtonsByGpsId(int gpsId) async {
    final db = await database;
    final res =await db!.delete('botones', where: 'gpsId = ?', whereArgs: [gpsId]);
    return res;
  }
}
