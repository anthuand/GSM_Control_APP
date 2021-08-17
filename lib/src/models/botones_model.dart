final String botones = 'botones';
final String gps = 'GPS';

class Boton {
  int? id;
  int? gpsId;
  String? nombre;
  String? mensaje;
  String? icono;


   Boton(
      {
       this.id,
       this.gpsId,
       this.nombre,
       this.mensaje,
       this.icono});

  factory Boton.fromJson(Map<String, dynamic> json) => new Boton(
        id: json["id"],
        gpsId: json["gpsId"],
        nombre: json["nombre"],
        mensaje: json["mensaje"],
        icono: json["icono"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gpsId": gpsId,
        "mensaje": mensaje,
        "nombre": nombre,
        "icono": icono,
      };
}

class Gps {
  int? id;
  String? nombre;
  String? numero;
  Gps({
     this.id,
     this.nombre,
     this.numero,
  });

  factory Gps.fromJson(Map<String, dynamic> json) => new Gps(
        id: json["id"],
        nombre: json["nombre"],
        numero: json["numero"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "numero": numero,
      };
}
