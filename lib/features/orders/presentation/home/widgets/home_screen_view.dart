import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/config/extension.dart';
import 'package:task/features/orders/presentation/home/widgets/summary_card.dart';
import 'package:task/features/orders/presentation/home/widgets/summary_pie_chart.dart';

import '../../../../../core/config/config.dart';
import '../../../../../core/routing/routes.dart';
import '../../../logic/entity/summary.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({
    super.key,
    required this.summary,
  });

  final OrderSummary summary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Text(
            'Summary Overview',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),

          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SummaryCard(
                title: 'Average Price',
                value:
                    '\$${summary.avgPrice.toStringAsFixed(Config.onScreenDecimalPoint)}',
                color: Colors.blue,
              ),
              SummaryCard(
                title: 'Total Count',
                value: summary.totalCount.toString(),
                color: Colors.green,
              ),
              SummaryCard(
                title: 'Returned Items',
                value: summary.returnedCount.toString(),
                color: Colors.red,
              ),
            ],
          ),
          SummaryPieChart(
            summary: summary,
          ),
          const Spacer(),
          ////////////////////////////
          ElevatedButton(
            onPressed: () {
              // Add your action here
              context.pushNamed(Routes.orderChartScreen);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 24.w,
              ),
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  12.r,
                ),
              ),
            ),
            child: Text(
              'Chart Screen',
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
          ),
          /////////////////////////
        ],
      ),
    );
  }
}
