import 'package:task/features/orders/logic/entity/summary.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeDataState extends HomeState {
  final OrderSummary summary;

  HomeDataState({
    required this.summary,
  });
}

final class HomeFailure extends HomeState {
  final String errorMessage;

  HomeFailure({required this.errorMessage});
}
