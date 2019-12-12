import 'package:data_sharing_with_sensor_mobile/models/nodo_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:data_sharing_with_sensor_mobile/utils/dataBase.dart'
    as dataBase;
import 'package:charts_flutter/flutter.dart' as charts;

class ReportesDiarios extends StatefulWidget {
  @override
  _ReportesDiariosState createState() => _ReportesDiariosState();
}

class _ReportesDiariosState extends State<ReportesDiarios>
    with TickerProviderStateMixin {
  final data = FirebaseDatabase.instance.reference();
  Query _query;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    dataBase.queryData("NODOPRUEBA").then((Query query) {
      setState(() {
        _query = query;
      });
    });
  }

  Widget _historial() {
    return FirebaseAnimatedList(
      query: _query,
      itemBuilder: (
        BuildContext context,
        DataSnapshot snapshot,
        Animation<double> animation,
        int index,
      ) {
        String nodoKey = snapshot.key;
        Nodo nodo = Nodo.fromSnapshot(snapshot);
        var _lista = nodo.aceleracionResultante.values.toList();
        return Column(
          children: <Widget>[
            ExpansionTile(
              key: ValueKey(nodoKey),
              title: new Text(
                'NODO: ${nodo.idNodo}',
                textAlign: TextAlign.center,
              ),
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Historial ',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        for (int i = 0; i < _lista.length; i++)
                          Text(
                            "Nro ${i + 1}: ${_lista[i].toString()}",
                            textAlign: TextAlign.center,
                          )
                      ],
                    )),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _grafica() {
    return Container(
      width: double.infinity,
      child: FirebaseAnimatedList(
        query: _query,
        itemBuilder: (
          BuildContext context,
          DataSnapshot snapshot,
          Animation<double> animation,
          int index,
        ) {
          String nodoKey = snapshot.key;
          Nodo nodo = Nodo.fromSnapshot(snapshot);
          //List<num> _lista = nodo.aceleracionResultante.values.toList();
          List<charts.Series<NodoData, dynamic>> _sampleData() {
            final _data = [
              NodoData(1, 5.3246),
              NodoData(2, 6.3246),
              NodoData(3, 1.3246),
            ];
            /*for (int i = 0; i < _lista.length; i++) {
              data.add(NodoData(i+1, _lista[i]));
            }*/
            return [
              new charts.Series<NodoData, dynamic>(
                id: 'Sales',
                colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                domainFn: (NodoData sales, _) => sales.pointer,
                measureFn: (NodoData sales, _) => sales.data,
                data: _data,
              )
            ];
          }

          return Column(key: ValueKey(nodoKey), children: <Widget>[
            Text(
              'NODO: ${nodo.idNodo}',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 200.0,
              width: double.infinity,
              child: charts.LineChart(
                _sampleData(),
                animate: false,
                defaultRenderer:
                    new charts.LineRendererConfig(includePoints: true),
              ),
            ),
            Divider()
          ]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabBar(
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.grey,
        controller: _controller,
        tabs: <Widget>[
          Tab(
            child: Text('GRAFICA'),
          ),
          Tab(
            child: Text('MAPA'),
          ),
          Tab(
            child: Text('HISTORIAL'),
          ),
        ],
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: <Widget>[
          _grafica(),
          _historial(),
          _historial(),
        ],
      ),
    );
  }
}

class NodoData {
  var pointer;
  var data;
  NodoData(this.pointer, this.data);
}
