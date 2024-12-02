import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });
  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          color: color.withOpacity(
            0.1,
          ),
          borderRadius: BorderRadius.circular(
            12.r,
          ),
          border: Border.all(
            color: color,
            width: 2.w,
          ),
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
            SizedBox(
              height: 8.h,
            ),
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
