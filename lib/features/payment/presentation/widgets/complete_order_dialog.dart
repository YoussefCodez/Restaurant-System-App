import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/core/utils/constants/strings_manager.dart';
import 'package:restaurant/core/widgets/custom_button.dart';
import 'package:restaurant/core/widgets/custom_unfilled_button.dart';
import 'package:restaurant/features/home/presentation/screens/home_screen.dart';
import 'package:restaurant/features/track_order/presentation/screens/track_order_screen.dart';

class CompleteOrderDialog extends StatelessWidget {
  const CompleteOrderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 400.h,
        width: 400.w,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            Lottie.asset(
              'assets/lottie/complete.json',
              width: 150.w,
              height: 150.h,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrackOrderScreen(),
                      ),
                    );
                  },
                  child: CustomButton(text: StringsManager.trackOrder),
                ),
                Gap(10.h),
                CustomUnfilledButton(
                  text: StringsManager.backHome,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
