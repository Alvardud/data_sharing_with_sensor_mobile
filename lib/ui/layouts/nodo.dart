import 'package:flutter/material.dart';
import 'package:data_sharing_with_sensor_mobile/ui/widgets/map.dart';
import 'package:data_sharing_with_sensor_mobile/ui/widgets/charts.dart';

class Nodo extends StatefulWidget {
  @override
  _NodoState createState() => _NodoState();
}

class _NodoState extends State<Nodo> with SingleTickerProviderStateMixin{

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabBar(     
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.grey,
        controller: _controller,
        tabs: <Widget>[
          Tab(child: Text('CHARTS'),),
          Tab(child: Text('MAP'),)
        ],
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: <Widget>[
          Chart(),
          Map()
        ],
      ),
    );
  }
}