import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task/di/di.dart';
import 'package:task/features/orders/logic/entity/order_filtered.dart';
import 'package:task/features/orders/presentation/order_chart/manager/order_chart_state.dart';

import '../order_chart/manager/order_chart_manager.dart';

class OrderChartScreen extends StatelessWidget {
  const OrderChartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Chart'),
      ),
      body: BlocProvider(
        create: (context) => locator<OrderChartManager>(),
        child: BlocBuilder<OrderChartManager, OrderChartState>(
          builder: (context, state) {
            return (switch (state) {
              (OrderChartDataState state) => SfCartesianChart(
                    tooltipBehavior: _tooltipBehavior,
                    title: const ChartTitle(text: 'Number of Order VS Date'),
                    legend: const Legend(
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap),
                    ///////////////////////////////////////////////////////
                    primaryXAxis: CategoryAxis(),
                    series: <LineSeries<OrderFilterResponse, num>>[
                      LineSeries<OrderFilterResponse, num>(
                        // Bind data source
                        dataSource: state.orders,

                        xValueMapper: (OrderFilterResponse response, _) =>
                            response.date.month,
                        yValueMapper: (OrderFilterResponse response, _) =>
                            response.orders.length,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true),
                      )
                    ]),

              ///////////////////////////////////////////////////////////

              //   Text(
              //   state.orders
              //       .map((e) => "${e.date} : ${e.orders.length}")
              //       .join(" - "),
              //   style: const TextStyle(
              //     color: Colors.black,
              //   ),
              // ),
              (OrderChartFailure state) => Text(state.errorMessage.toString()),
              (_) => const Center(child: CircularProgressIndicator()),
            });
          },
        ),
      ),
    );
  }
}
