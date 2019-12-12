import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart' as charts;

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  charts.LineChartOptions _lineChartOptions;
  charts.ChartOptions _verticalBarChartOptions;
  charts.LabelLayoutStrategy _xContainerLabelLayoutStrategy;
  charts.ChartData _chartData;

  void defineOptionsAndData() {
    _lineChartOptions = new charts.LineChartOptions();
    _verticalBarChartOptions = new charts.VerticalBarChartOptions();
    _xContainerLabelLayoutStrategy =
        new charts.DefaultIterativeLabelLayoutStrategy(
      options: _verticalBarChartOptions,
    );
    _chartData = new charts.RandomChartData(
        useUserProvidedYLabels: _lineChartOptions.useUserProvidedYLabels);
  }

  @override
  Widget build(BuildContext context) {
    void _chartStateChanger() {
      setState(() {
      });
    }

    defineOptionsAndData();
    charts.VerticalBarChart verticalBarChart = new charts.VerticalBarChart(
      painter: new charts.VerticalBarChartPainter(),
      container: new charts.VerticalBarChartContainer(
        chartData: _chartData, 
        chartOptions: _verticalBarChartOptions, 
        xContainerLabelLayoutStrategy:
            _xContainerLabelLayoutStrategy, 
      ),
    );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50.0,),
          new Expanded(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                new Expanded(
                  child: verticalBarChart, 
                ),
              ],
            ),
          ),
          new RaisedButton(
            color: Colors.green,
            onPressed: _chartStateChanger,
          ),
        ],
      ),
    );
  }
}
