import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:data_sharing_with_sensor_mobile/models/usuarios.dart';
import 'package:data_sharing_with_sensor_mobile/utils/dataBase.dart'
    as dataBase;

class DataBaseTest extends StatefulWidget {
  @override
  _DataBaseTestState createState() => _DataBaseTestState();
}

class _DataBaseTestState extends State<DataBaseTest> {
  final data = FirebaseDatabase.instance.reference();
  Query _query;

  @override
  void initState() {
    super.initState();
    dataBase.queryData("usuarios").then((Query query) {
      setState(() {
        _query = query;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
        query: _query,
        itemBuilder: (
          BuildContext context,
          DataSnapshot snapshot,
          Animation<double> animation,
          int index,
        ) {
          String userKey = snapshot.key;
          Usuario usuario = Usuario.fromSnaphot(snapshot);
          if (_query != null) {
            return Column(
              children: <Widget>[
                new ListTile(
                  key: ValueKey(userKey),
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                  title: new Text(
                    '${usuario.apellidos} ${usuario.nombres}',
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Cargo: ${usuario.cargo}"),
                        Text("CI: ${usuario.ci}"),
                        Text("Correo: ${usuario.correo}"),
                        Text("Telefono: ${usuario.telefono}"),
                        Text("Fecha Registro: ${usuario.fechaRegistro}"),
                      ],
                    ),
                  ),
                ),
                new Divider(
                  height: 2.0,
                ),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
