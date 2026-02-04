import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
class MenuSkeletonItem extends StatelessWidget {
  const MenuSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.all(8.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
            Gap(8.h),
            Container(height: 16.h, width: 100.w, color: Colors.grey),
            Gap(6.h),
            Container(height: 14.h, width: 60.w, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
