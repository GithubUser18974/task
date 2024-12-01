import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/entity/summary.dart';
import '../../../logic/use_case/get_order_summary_use_case.dart';
import 'home_state.dart';

class HomeManager extends Cubit<HomeState> {
  HomeManager({
    required GetOrderSummaryUseCase getOrderSummaryUseCase,
  })  : _getOrderSummaryUseCase = getOrderSummaryUseCase,
        super(HomeInitial()) {
    loadData();
  }

  final GetOrderSummaryUseCase _getOrderSummaryUseCase;

  Future<void> loadData() async {
    emit(HomeLoading());
    try {
      final OrderSummary orderSummary = await _getOrderSummaryUseCase.call();
      emit(HomeDataState(
        summary: orderSummary,
      ));
    } catch (e) {
      emit(HomeFailure(errorMessage: e.toString()));
    }
  }
}
