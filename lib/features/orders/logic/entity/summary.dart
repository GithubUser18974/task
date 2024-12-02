import 'package:flutter/material.dart';
import 'package:task/features/orders/logic/entity/order.dart';

class OrderSummary {
  final int totalCount;
  final int returnedCount;
  final int orderedCount;
  final int deliveredCount;
  final double avgPrice;
  final double totalPrice;

  OrderSummary({
    required this.totalCount,
    required this.returnedCount,
    required this.orderedCount,
    required this.deliveredCount,
    required this.avgPrice,
    required this.totalPrice,
  });

  factory OrderSummary.fromOrders(List<OrdersEntity> orders) {
    double totalPrice = 0;
    int totalOrderCount = orders.length;
    int totalReturnCount =
        orders.where((e) => e.status == OrderStatus.RETURNED).length;
    int orderedCount =
        orders.where((e) => e.status == OrderStatus.ORDERED).length;
    int deliveredCount =
        orders.where((e) => e.status == OrderStatus.DELIVERED).length;

    for (var order in orders) {
      totalPrice += order.actualPrice;
    }
    double avgPrice = totalPrice / totalOrderCount;

    return OrderSummary(
      totalCount: totalOrderCount,
      returnedCount: totalReturnCount,
      orderedCount: orderedCount,
      deliveredCount: deliveredCount,
      avgPrice: avgPrice,
      totalPrice: totalPrice,
    );
  }

  List<ChartData> get chartData => [
        ChartData(
          title: "Delivered",
          value: deliveredCount.toDouble(),
          color: Colors.green,
        ),
        ChartData(
          title: "Ordered",
          value: orderedCount.toDouble(),
          color: Colors.blue,
        ),
        ChartData(
          title: "Returned",
          value: returnedCount.toDouble(),
          color: Colors.red,
        ),
      ];
}

class ChartData {
  ChartData({
    required this.title,
    required this.value,
    required this.color,
  });

  final String title;
  final double value;
  final Color? color;
}
