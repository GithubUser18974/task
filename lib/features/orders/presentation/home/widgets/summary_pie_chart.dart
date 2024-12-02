import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../logic/entity/summary.dart';

class SummaryPieChart extends StatelessWidget {
  SummaryPieChart({
    super.key,
    required this.summary,
  });
  final OrderSummary summary;
  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          PieSeries<ChartData, String>(
            dataSource: summary.chartData,
            pointColorMapper: (ChartData data, _) => data.color,
            xValueMapper: (ChartData data, _) => data.title,
            yValueMapper: (ChartData data, _) => data.value,
            dataLabelMapper: (ChartData data, _) => data.title,
            animationDuration: 800,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelIntersectAction: LabelIntersectAction.none,
              overflowMode: OverflowMode.shift,
              showZeroValue: true,
              labelPosition: ChartDataLabelPosition.outside,
              connectorLineSettings: ConnectorLineSettings(
                type: ConnectorType.curve,
              ),
            ),
          ),
        ]);
  }
}
