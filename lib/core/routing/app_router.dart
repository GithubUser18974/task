import 'package:flutter/material.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/features/orders/presentation/home/home_screen.dart';
import 'package:task/features/orders/presentation/order_chart/order_chart_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.orderChartScreen:
        return MaterialPageRoute(builder: (_) => const OrderChartScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
