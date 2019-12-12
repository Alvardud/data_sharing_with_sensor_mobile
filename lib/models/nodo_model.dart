import 'package:firebase_database/firebase_database.dart';

class Nodo {
  Map<dynamic, dynamic> aceleracionResultante;
  Map<dynamic, dynamic> aceleracionX;
  Map<dynamic, dynamic> aceleracionY;
  Map<dynamic, dynamic> aceleracionZ;
  Map<dynamic, dynamic> anguloInclinacionX;
  Map<dynamic, dynamic> anguloInclinacionY;
  num estado;
  num idNodo;
  num latitud;
  num longitud;

  Nodo(
      {this.aceleracionResultante,
      this.aceleracionX,
      this.aceleracionY,
      this.aceleracionZ,
      this.anguloInclinacionX,
      this.anguloInclinacionY,
      this.estado,
      this.idNodo,
      this.latitud,
      this.longitud});

  factory Nodo.fromSnapshot(DataSnapshot snapshot) {
    return Nodo(
      aceleracionResultante: snapshot.value["aceleracionresultante"],
      aceleracionX: snapshot.value["aceleracionx"],
      aceleracionY: snapshot.value["aceleraciony"],
      aceleracionZ: snapshot.value["aceleracionz"],
      anguloInclinacionX: snapshot.value["anguloinclinacionx"],
      anguloInclinacionY: snapshot.value["anguloinclinaciony"],
      estado: snapshot.value["estado"],
      idNodo: snapshot.value["id_nodo"],
      latitud: snapshot.value["latitud"],
      longitud: snapshot.value["longitud"],
    );
  }
}
