import 'package:alpata_assignment/core/enum/load_statuas.dart';
import 'package:alpata_assignment/core/extensions/size_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/annual_sale_data_model.dart';

class StockMarketChart extends StatelessWidget {
  const StockMarketChart(
      {Key? key,
      required this.loadStatus,
      this.annualSaleDataModels,
      required this.errorStr})
      : super(key: key);
  final LoadStatus loadStatus;
  final List<Data>? annualSaleDataModels;
  final String errorStr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.setScaledWidth(0.9),
      height: context.setScaledHeight(0.5),
      child: returnWidgetByLoadStatus(),
    );
  }

  Widget returnWidgetByLoadStatus() {
    if (loadStatus == LoadStatus.loaded) {
      return LineChart(LineChartData(
          minY: 0,
          minX: 1,
          maxX: 12,
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
                spots: annualSaleDataModels!
                    .map((saleValue) => FlSpot(saleValue.aY?.toDouble() ?? 0.0,
                        saleValue.fIYAT ?? 0.0))
                    .toList())
          ]));
    } else if (loadStatus == LoadStatus.error) {
      return Center(child: Text(errorStr));
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
