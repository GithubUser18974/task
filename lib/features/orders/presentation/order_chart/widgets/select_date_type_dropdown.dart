import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/entity/order_filtered.dart';
import '../manager/order_chart_manager.dart';

class SelectDateTypeDropdown extends StatefulWidget {
  final OrderFilterType? selectedValue;

  const SelectDateTypeDropdown({
    super.key,
    this.selectedValue,
  });

  @override
  State<SelectDateTypeDropdown> createState() => _SelectDateTypeDropdownState();
}

class _SelectDateTypeDropdownState extends State<SelectDateTypeDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<OrderFilterType>(
      hint: const Text(
        "Select Filter Date Type",
        textAlign: TextAlign.center,
      ),
      value: widget.selectedValue,
      items: OrderFilterType.values.map((OrderFilterType value) {
        return DropdownMenuItem<OrderFilterType>(
          value: value,
          child: Align(
            alignment: Alignment.center, // Center-align each item
            child: Text(
              value.name.toUpperCase(),
            ),
          ),
        );
      }).toList(),
      onChanged: (OrderFilterType? newValue) {
        if (newValue != null) {
          context.read<OrderChartManager>().updateType(
                newValue,
              );
        }
      },
    );
  }
}
