import 'package:flutter/material.dart';
import 'package:data_sharing_with_sensor_mobile/data_provider/constants.dart'
    as constant;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _pointer;

  Widget _menuElement(String title, int pointer) {
    return ExpansionTile(
      title: Text('$title'),
      leading: Icon(constant.iconsDrawer[pointer]),
      children: <Widget>[
        ListView.builder(
          padding: EdgeInsets.all(0.0),
          shrinkWrap: true,
          itemCount: constant.titlesDrawer[pointer].length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text("${constant.titlesDrawer[pointer][index]}")),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _pointer = constant.layouts[pointer][index];
                });
              },
            );
          },
        )
      ],
    );
  }

  Widget _customDrawer() {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(height: 250, color: Theme.of(context).primaryColor),
          ListView.builder(
              padding: EdgeInsets.all(0.0),
              shrinkWrap: true,
              itemCount: constant.mainTitlesDrawer.length,
              itemBuilder: (context, index) {
                return _menuElement(constant.mainTitlesDrawer[index], index);
              })
        ],
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    _pointer = constant.layouts[0][0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _customDrawer(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        title: Text('Adriana' //TODO: change to user
            ),
      ),
      body: _pointer,
    );
  }
}
