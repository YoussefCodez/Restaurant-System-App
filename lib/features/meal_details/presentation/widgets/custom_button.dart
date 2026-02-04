import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/core/theme/color_manager.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.text, required this.onTap, required this.selected});
  final String text;
  final Function onTap;
  final bool selected;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: widget.selected ? ColorsManager.primary : ColorsManager.inputs,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: .w400,
            color: widget.selected ? Colors.white: ColorsManager.thirdColor,
          ),
        ),
      ),
    );
  }
}
