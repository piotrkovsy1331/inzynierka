import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SummaryBarChart extends StatelessWidget {
  SummaryBarChart(
      {Key? key,
      required this.chartData,
      required this.title,
      required this.color})
      : super(key: key);

  List<ChartData> chartData;
  String title;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8.0),
      child: SfCartesianChart(
        zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true,
          zoomMode: ZoomMode.x,
          enablePanning: true,
        ),
        title: ChartTitle(
            text: title,
            alignment: ChartAlignment.center,
            textStyle: Theme.of(context).textTheme.headline4),
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries<ChartData, String>>[
          // Renders column chart
          ColumnSeries<ChartData, String>(
              color: color,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
