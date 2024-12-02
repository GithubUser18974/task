import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task/features/orders/logic/entity/order_filtered.dart';
import 'package:task/features/orders/presentation/order_chart/manager/order_chart_state.dart';

import '../../../../core/di/di.dart';
import '../order_chart/manager/order_chart_manager.dart';

class OrderChartScreen extends StatelessWidget {
  const OrderChartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Chart'),
      ),
      body: BlocProvider(
        create: (context) => locator<OrderChartManager>(),
        child: BlocBuilder<OrderChartManager, OrderChartState>(
          builder: (context, state) {
            return (switch (state) {
              (OrderChartDataState state) => OrderChartData(
                  state: state,
                ),
              (OrderChartFailure state) => Text(
                  state.errorMessage.toString(),
                ),
              (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
            });
          },
        ),
      ),
    );
  }
}

class OrderChartData extends StatelessWidget {
  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  final OrderChartDataState state;
  OrderChartData({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () async {
                  final selected = await showMonthYearPicker(
                    context: context,
                    initialDate: state.request.date,
                    firstDate: DateTime(2019),
                    lastDate: DateTime.now(),
                    initialMonthYearPickerMode: MonthYearPickerMode.year,
                  );
                  if (selected != null && context.mounted) {
                    context.read<OrderChartManager>().updateDate(selected);
                  }
                },
                child: Text(
                  state.request.dateFormat(state.request.date),
                ),
              ),
            ],
          ),
        ),
        SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          title: const ChartTitle(
            text: 'Number of Order VS Month',
          ),
          legend: const Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
          ),
          primaryXAxis: const CategoryAxis(),
          series: <LineSeries<OrderFilterResponse, String>>[
            LineSeries<OrderFilterResponse, String>(
              name: "Orders",
              dataSource: state.orders,
              xValueMapper: (OrderFilterResponse response, _) =>
                  state.request.dateFormat(response.date),
              yValueMapper: (OrderFilterResponse response, _) =>
                  response.orders.length,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
              ),
            )
          ],
        ),
      ],
    );
  }
}
