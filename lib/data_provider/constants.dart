import 'package:data_sharing_with_sensor_mobile/ui/layouts/nodo.dart';
import 'package:flutter/material.dart';

//"Inicio", "Usuarios", "Proyectos", "Nodos"
const List<List<String>> titlesDrawer = [
  ["Registro", "Modificar", "Listar"],
  ["Registro", "Modificar", "Listar"],
  ["Reportes Diarios", "Datos historicos"]
];

List<List<Widget>> layouts = [
  [
    Container(color: Colors.white),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ],
  [
    Container(color: Colors.red),
    Container(color: Colors.yellow),
    Container(color: Colors.blueGrey),
  ],
  [
    Container(color: Colors.white),
    Nodo(),
  ]
];

const List<String> mainTitlesDrawer = ['Proyectos', 'Nodos', 'Reportes'];
const List<IconData> iconsDrawer = [
  Icons.home,
  Icons.people,
  Icons.book,
  Icons.cloud_circle
];
