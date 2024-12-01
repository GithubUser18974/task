import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/di/di.dart';
import 'package:task/features/orders/presentation/order_chart/manager/order_chart_state.dart';

import '../order_chart/manager/order_chart_manager.dart';

class OrderChartScreen extends StatelessWidget {
  const OrderChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: BlocProvider(
        create: (context) => locator<OrderChartManager>(),
        child: BlocBuilder<OrderChartManager, OrderChartState>(
          builder: (context, state) {
            return (switch (state) {
              (OrderChartDataState state) => Text(
                  state.orders
                      .map((e) => "${e.date} : ${e.orders.length}")
                      .join(" - "),
                ),
              (OrderChartFailure state) => Text(state.errorMessage.toString()),
              (_) => const Center(child: CircularProgressIndicator()),
            });
          },
        ),
      ),
    );
  }
}
