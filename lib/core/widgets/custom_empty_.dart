import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class CustomEmpty extends StatelessWidget {
  const CustomEmpty({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text(
            text,
            textAlign: .center,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: .w300,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          Gap(20.h),
          Lottie.asset("assets/lottie/empty.json", width: 300.w, height: 300.h),
        ],
      ),
    );
  }
}
