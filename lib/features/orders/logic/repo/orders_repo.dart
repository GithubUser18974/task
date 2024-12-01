import 'package:task/features/orders/logic/entity/order.dart';

abstract class OrderRepo {
  Future<List<OrdersEntity>> getAllOrders();
}
