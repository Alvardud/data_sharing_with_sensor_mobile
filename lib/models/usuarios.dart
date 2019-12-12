import 'package:firebase_database/firebase_database.dart';

class Usuarios{

  final String codigo;
  final Usuario usuario;

  Usuarios({
    this.codigo,
    this.usuario
  });

  factory Usuarios.fromJson(Map<String, dynamic>json){
    return Usuarios(
      //codigo: json[''];
    );
  }
}

class Usuario {
  String apellidos;
  String nombres;
  String cargo;
  int telefono;
  int ci;
  String correo;
  String fechaRegistro;
  int rol;

  Usuario(
      {this.apellidos,
      this.cargo,
      this.ci,
      this.correo,
      this.fechaRegistro,
      this.nombres,
      this.rol,
      this.telefono});

  factory Usuario.fromSnaphot(DataSnapshot snapshot) {
    return Usuario(
        apellidos: snapshot.value['apellido'],
        cargo: snapshot.value['cargo'],
        correo: snapshot.value['correo'],
        ci: snapshot.value['ci'],
        fechaRegistro: snapshot.value['fechaRegistro'],
        nombres: snapshot.value['nombre'],
        rol: snapshot.value['rol'],
        telefono: snapshot.value['celular']);
  }
}
