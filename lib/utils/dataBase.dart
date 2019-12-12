import 'package:data_sharing_with_sensor_mobile/models/usuarios.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase()
  ..setPersistenceEnabled(true)
  ..setPersistenceCacheSizeBytes(10000000);

Future<String> _getAccountKey() async {
  return "adriana-6a903";
}

Future<Query> queryData(String key) async {
  return FirebaseDatabase.instance
      .reference()
      .child(key);
}

