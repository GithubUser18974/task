import 'package:task/features/orders/logic/entity/order.dart';

class OrderSummary {
  final int totalCount;
  final int returnedCount;
  final double avgPrice;
  final double totalPrice;

  OrderSummary({
    required this.totalCount,
    required this.returnedCount,
    required this.avgPrice,
    required this.totalPrice,
  });

  factory OrderSummary.fromOrders(List<OrdersEntity> orders) {
    double totalPrice = 0;
    int totalOrderCount = orders.length;
    int totalReturnCount =
        orders.where((e) => e.status == OrderStatus.RETURNED).length;

    for (var order in orders) {
      totalPrice += order.actualPrice;
    }
    double avgPrice = totalPrice / totalOrderCount;

    return OrderSummary(
      totalCount: totalOrderCount,
      returnedCount: totalReturnCount,
      avgPrice: avgPrice,
      totalPrice: totalPrice,
    );
  }
}
