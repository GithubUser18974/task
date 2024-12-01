import '../entity/summary.dart';
import '../repo/orders_repo.dart';

class GetOrderSummaryUseCase {
  final OrderRepo _orderRepo;

  GetOrderSummaryUseCase({
    required OrderRepo orderRepo,
  }) : _orderRepo = orderRepo;

  Future<OrderSummary> call() async {
    final orders = await _orderRepo.getAllOrders();

    return OrderSummary.fromOrders(orders);
  }
}
