import 'package:task/features/orders/logic/entity/order_filtered.dart';

abstract class OrderChartState {
  final OrderFilterRequest request;

  OrderChartState({
    required this.request,
  });
}

final class OrderChartInitial extends OrderChartState {
  OrderChartInitial() : super(request: OrderFilterRequest.initial());
}

final class OrderChartLoading extends OrderChartState {
  OrderChartLoading({required super.request});
}

final class OrderChartDataState extends OrderChartState {
  final List<OrderFilterResponse> orders;

  OrderChartDataState({
    required this.orders,
    required super.request,
  });
}

final class OrderChartFailure extends OrderChartState {
  final String errorMessage;

  OrderChartFailure({
    required this.errorMessage,
    required super.request,
  });
}
