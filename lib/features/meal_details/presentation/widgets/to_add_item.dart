import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:restaurant/core/theme/color_manager.dart';
import 'package:restaurant/core/utils/responsive/device_utils.dart';

class ToAddItem extends StatelessWidget {
  const ToAddItem({
    super.key,
    required this.svg,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String svg;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: text == "Onion"
                ? DeviceUtils.isTablet(context) 
                ? EdgeInsets.symmetric(horizontal: 14.w, vertical: 17.h)
                : EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h)
                : EdgeInsets.all(15.r),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBE4),
              borderRadius: BorderRadius.circular(50.r),
              border: isSelected
                  ? Border.all(color: Colors.green, width: 2)
                  : null,
            ),
            child: SvgPicture.asset(
              svg,
              width: DeviceUtils.isTablet(context) ? 30.w : 20.w,
              height: DeviceUtils.isTablet(context) ? 30.h : 20.h,
            ),
          ),
          Gap(5.h),
          Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
                  fontWeight: .w500,
              color: ColorsManager.fourthColor,
            ),
          ),
        ],
      ),
    );
  }
}
