import 'package:collection/collection.dart';
import 'package:task/features/orders/logic/entity/order_filtered.dart';

import '../entity/order.dart';
import '../repo/orders_repo.dart';

class GetFilterOrdersUseCase {
  final OrderRepo _orderRepo;

  GetFilterOrdersUseCase({
    required OrderRepo orderRepo,
  }) : _orderRepo = orderRepo;

  Future<List<OrderFilterResponse>> call({
    required OrderFilterRequest request,
  }) async {
    List<OrderFilterResponse> returnedValue = [];
    final allOrders = await _orderRepo.getAllOrders();

    final filteredOrders = allOrders
        .where(
          (e) => request.filterDate(e.registered),
        )
        .toList();

    Map<DateTime, List<OrdersEntity>> groupedOrders =
        filteredOrders.groupListsBy(
      (a) => request.dateByRequestType(a.registered),
    );

    groupedOrders.forEach((key, value) {
      returnedValue.add(OrderFilterResponse(
        date: key,
        orders: value,
      ));
    });

    returnedValue.sort(
      (a, b) => a.date.compareTo(b.date),
    );
    return returnedValue;
  }
}
