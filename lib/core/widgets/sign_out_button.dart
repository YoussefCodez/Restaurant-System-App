import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/core/utils/constants/strings_manager.dart';
import 'package:restaurant/features/auth/logic/cubit/auth_cubit.dart';
import 'package:restaurant/features/auth/presentation/screens/Login/login_screen.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignedOut) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => LoginScreen()),
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<AuthCubit>().signOut();
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 20.h),
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Text(
              StringsManager.signOut,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontSize: 15.sp,
                fontWeight: .bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
