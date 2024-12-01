import 'package:get_it/get_it.dart';
import 'package:task/features/orders/data/repo_impl/orders_repo_impl.dart';
import 'package:task/features/orders/logic/repo/orders_repo.dart';

import '../features/orders/logic/use_case/get_all_orders_use_case.dart';
import '../features/orders/logic/use_case/get_filter_orders_use_case.dart';
import '../features/orders/logic/use_case/get_order_summary_use_case.dart';
import '../features/orders/presentation/home/manager/home_manager.dart';
import '../features/orders/presentation/order_chart/manager/order_chart_manager.dart';

final GetIt locator = GetIt.instance;

void configureDependencies() {
  locator.registerLazySingleton<OrderRepo>(() => OrdersRepoImpl());
  locator.registerLazySingleton<GetAllOrderUseCase>(
    () => GetAllOrderUseCase(
      orderRepo: locator(),
    ),
  );
  locator.registerLazySingleton<GetOrderSummaryUseCase>(
    () => GetOrderSummaryUseCase(
      orderRepo: locator(),
    ),
  );
  locator.registerLazySingleton<GetFilterOrdersUseCase>(
    () => GetFilterOrdersUseCase(
      orderRepo: locator(),
    ),
  );
  locator.registerFactory<HomeManager>(
    () => HomeManager(
      getOrderSummaryUseCase: locator(),
    ),
  );
  locator.registerFactory<OrderChartManager>(
    () => OrderChartManager(
      getFilterOrdersUseCase: locator(),
    ),
  );
}
