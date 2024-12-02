import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/config/extension.dart';

import '../../../../../core/config/config.dart';
import '../../../../../core/routing/routes.dart';
import '../../../logic/entity/summary.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key, required this.summary});
  final OrderSummary summary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
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
                _buildStatCard(
                    'Average Price',
                    '\$${summary.avgPrice.toStringAsFixed(Config.onScreenDecimalPoint)}',
                    Colors.blue),
                _buildStatCard(
                    'Total Count', summary.totalCount.toString(), Colors.green),
                _buildStatCard('Returned Items',
                    summary.returnedCount.toString(), Colors.red),
              ],
            ),
            const Spacer(),
            ////////////////////////////
            ElevatedButton(
              onPressed: () {
                // Add your action here
                context.pushNamed(Routes.orderChartScreen);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Chart Screen',
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
            ),
            /////////////////////////
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: color, width: 2.w),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              value,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
