import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/config/config.dart';
import 'package:task/di/di.dart';

import 'manager/home_manager.dart';
import 'manager/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: BlocProvider(
        create: (context) => locator<HomeManager>(),
        child: BlocBuilder<HomeManager, HomeState>(
          builder: (context, state) {
            return (switch (state) {
              (HomeDataState state) => Text(
                  state.summary.avgPrice
                      .toStringAsFixed(Config.onScreenDecimalPoint),
                ),
              (HomeFailure state) => Text(state.errorMessage.toString()),
              (_) => const Center(child: CircularProgressIndicator()),
            });
          },
        ),
      ),
    );
  }
}
