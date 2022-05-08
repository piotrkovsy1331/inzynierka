import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SummaryDougnhutChart extends StatelessWidget {
  const SummaryDougnhutChart(
      {Key? key, required this.chartData, required this.title})
      : super(key: key);
  final List<DoughnutChartData> chartData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5.0),
      child: Card(
        color: Theme.of(context).backgroundColor,
        elevation: 4,
        child: SfCircularChart(
            title: ChartTitle(
                text: title,
                alignment: ChartAlignment.near,
                textStyle: Theme.of(context).textTheme.headline3),
            legend: Legend(isVisible: true, isResponsive: false),
            series: <CircularSeries>[
              // Render pie chart
              PieSeries<DoughnutChartData, String>(
                  dataSource: chartData,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  pointColorMapper: (DoughnutChartData data, _) => data.color,
                  xValueMapper: (DoughnutChartData data, _) => data.name,
                  yValueMapper: (DoughnutChartData data, _) =>
                      data.value.toInt())
            ]),
      ),
    );
  }
}

class DoughnutChartData {
  DoughnutChartData(this.name, this.value, this.color);
  final String name;
  final double value;
  final Color color;
}
