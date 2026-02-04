import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:restaurant/core/theme/color_manager.dart';

class MethodWidget extends StatelessWidget {
  const MethodWidget({
    super.key,
    required this.text,
    required this.svg,
    required this.onTap,
    required this.isSelected,
  });
  final String text;
  final String svg;
  final Function onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Stack(
            clipBehavior: .none,
            children: [
              Container(
                padding: EdgeInsets.all(30.r),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.transparent : ColorsManager.holderColor,
                  borderRadius: BorderRadius.circular(10.r),
                  border: isSelected
                      ? Border.all(
                          color: ColorsManager.primary,
                          width: 2.w,
                        )
                      : null,
                ),
                child: SvgPicture.asset(svg, width: 24.w, height: 24.h),
              ),
              if (isSelected)
                Positioned(
                  top: -8.h,
                  right: -8.w,
                  child: Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: ColorsManager.primary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 2.w,
                      ),
                    ),
                    child: Icon(Icons.check, color: Colors.white, size: 16.r),
                  ),
                ),
            ],
          ),
          Gap(5.h),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: .w500,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
