import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/features/auth/logic/cubit/user_name_cubit.dart';
import 'package:restaurant/core/utils/constants/strings_manager.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({super.key, required this.color});
  final ColorScheme color;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserNameCubit, UserNameState, String?>(
      selector: (state) {
        if (state is UserNameLoaded) {
          return state.name;
        }
        return null;
      },
      builder: (context, name) {
        if (name != null) {
          return Text(
            "${StringsManager.hello}, $name",
            style: TextStyle(
              color: color.onSecondaryContainer,
              fontSize: 22.sp,
              fontWeight: .w900,
            ),
          );
        } else {
          return Text(
            StringsManager.hello,
            style: TextStyle(
              color: color.onSecondaryContainer,
              fontSize: 22.sp,
              fontWeight: .w900,
            ),
          );
        }
      },
    );
  }
}
