import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/core/theme/color_manager.dart';
import 'package:restaurant/core/utils/constants/strings_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key , required this.controller , required this.focusNode , required this.isEnabled , this.onChanged});
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isEnabled;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      enabled: isEnabled,
      cursorWidth: 2,
      onChanged: onChanged,
      cursorColor: ColorsManager.primary,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: .normal,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManager.textFieldFillColor,
        contentPadding: EdgeInsets.symmetric(vertical: 20.h),
        prefixIcon: Padding(
          padding: EdgeInsets.all(8.r),
          child: Icon(Icons.search, color: ColorsManager.secondryText, size: 20.sp,),
        ),
        hint: Text(
          StringsManager.search,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: .normal,
            color: ColorsManager.secondryText,
          ),
        ),
        enabledBorder: TextFieldBorder(context),
        focusedBorder: TextFieldBorder(context),
        disabledBorder: TextFieldBorder(context),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.red, width: 3),
        ),
      ),
    );
  }
}

OutlineInputBorder TextFieldBorder(BuildContext context) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: Theme.of(context).scaffoldBackgroundColor),
    borderRadius: BorderRadius.circular(10.r),
  );
}
