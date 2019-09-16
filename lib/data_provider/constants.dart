import 'package:data_sharing_with_sensor_mobile/ui/layouts/nodo.dart';
import 'package:flutter/material.dart';

const List<String> titlesDrawer = ["Inicio", "Usuarios", "Proyectos", "Nodos"];
const List<IconData> iconsDrawer = [
  Icons.home,
  Icons.people,
  Icons.book,
  Icons.cloud_circle
];
List<Widget> layouts = [
  Container(color: Colors.white),
  Container(color: Colors.green),
  Container(color: Colors.blue),
  Nodo(),
];
