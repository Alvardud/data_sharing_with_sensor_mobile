import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

final String name = "foo";
final FirebaseOptions options = FirebaseOptions(
  googleAppID: "1:122002728947:android:75f3d8fc74dc0214de5486",
  apiKey: "AIzaSyBjJBxEGC42ZYzWjPGW8wnQlLsr2IzZy5s",
  databaseURL: "https://adriana-6a903.firebaseio.com",
);

class FirebaseExample extends StatefulWidget {
  @override
  _FirebaseExampleState createState() => _FirebaseExampleState();
}

class _FirebaseExampleState extends State<FirebaseExample> {

   Future<void> _configure() async {
    final FirebaseApp app = await FirebaseApp.configure(
      name: name,
      options: options,
    );
    assert(app != null);
    print('Configured $app');
  }

  Future<void> _allApps() async {
    final List<FirebaseApp> apps = await FirebaseApp.allApps();
    print('Currently configured apps: $apps');
  }

  Future<void> _options() async {
    final FirebaseApp app = await FirebaseApp.appNamed(name);
    final FirebaseOptions options = await app?.options;
    print('Current options for app $name: $options');
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(

    );
  }
}