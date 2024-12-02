import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/entity/order_filtered.dart';
import '../../../logic/use_case/get_filter_orders_use_case.dart';
import 'order_chart_state.dart';

class OrderChartManager extends Cubit<OrderChartState> {
  OrderChartManager({
    required GetFilterOrdersUseCase getFilterOrdersUseCase,
  })  : _getFilterOrdersUseCase = getFilterOrdersUseCase,
        super(OrderChartInitial()) {
    loadData();
  }

  final GetFilterOrdersUseCase _getFilterOrdersUseCase;

  Future<void> updateType(OrderFilterType type) async {
    emit(
      OrderChartLoading(
        request: state.request.coyWith(
          type: type,
        ),
      ),
    );
    await loadData();
  }

  Future<void> updateDate(DateTime date) async {
    emit(OrderChartLoading(request: state.request.coyWith(date: date)));

    await loadData();
  }

  Future<void> loadData() async {
    emit(OrderChartLoading(request: state.request));
    try {
      final List<OrderFilterResponse> orders =
          await _getFilterOrdersUseCase.call(
        request: state.request,
      );
      emit(OrderChartDataState(
        orders: orders,
        request: state.request,
      ));
    } catch (e) {
      emit(OrderChartFailure(
        errorMessage: e.toString(),
        request: state.request,
      ));
    }
  }
}
