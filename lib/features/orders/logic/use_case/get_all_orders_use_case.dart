import 'package:task/features/orders/logic/entity/order.dart';

import '../repo/orders_repo.dart';

class GetAllOrderUseCase {
  final OrderRepo _orderRepo;

  GetAllOrderUseCase({
    required OrderRepo orderRepo,
  }) : _orderRepo = orderRepo;

  Future<List<OrdersEntity>> call() async {
    return await _orderRepo.getAllOrders();
  }
}
