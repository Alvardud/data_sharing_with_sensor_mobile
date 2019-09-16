import 'package:flutter/material.dart';
import 'package:data_sharing_with_sensor_mobile/data_provider/constants.dart'
    as constant;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pointer;

  Widget _customDrawer() {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(height: 250, color: Theme.of(context).primaryColor),
        ListView.builder(
          shrinkWrap: true,
          itemCount: constant.titlesDrawer.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(constant.iconsDrawer[index]),
              title: Text(constant.titlesDrawer[index]),
              onTap: () {
                if (_pointer != index) {
                  Navigator.pop(context);
                  setState(() {
                    _pointer = index;
                  });
                }
              },
            );
          },
        )
      ],
    ));
  }

  @override
  void initState() {
    super.initState();
    _pointer = 0;
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
      body: constant.layouts[_pointer],
    );
  }
}
