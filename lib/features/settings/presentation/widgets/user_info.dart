import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:restaurant/core/utils/validators/valdiator.dart';
import 'package:restaurant/core/utils/constants/strings_manager.dart';
import 'package:restaurant/core/widgets/custom_field.dart';
import 'package:restaurant/core/widgets/custom_field_text.dart';
import 'package:restaurant/features/auth/logic/cubit/auth_cubit.dart';
import 'package:restaurant/features/settings/logic/cubit/edit_profile_cubit.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.usernameController,
    required this.emailController,
  });

  final TextEditingController usernameController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Gap(20.h),
        CustomFieldText(text: StringsManager.username),
        Gap(10.h),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                usernameController.text = state.user.name;
              });
            } else if (state is AuthLoading) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                usernameController.text = StringsManager.loading;
              });
            }
            return BlocBuilder<EditProfileCubit, bool>(
              builder: (context, state) {
                return CustomField(
                  controller: usernameController,
                  hintText: StringsManager.username,
                  isEnabled: state,
                  validator: (value) {
                    return Valdiator.nameValidator(value);
                  },
                );
              },
            );
          },
        ),
        Gap(20.h),
        CustomFieldText(text: StringsManager.emailText),
        Gap(10.h),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                emailController.text = state.user.email;
              });
            } else if (state is AuthLoading) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                emailController.text = StringsManager.loading;
              });
            }
            return CustomField(
              controller: emailController,
              hintText: StringsManager.emailText,
              isEnabled: false,
              validator: (v) {
                return null;
              },
            );
          },
        ),
        BlocBuilder<EditProfileCubit, bool>(
          builder: (context, edit) {
            if (edit) {
              return Column(
                children: [
                  Gap(5.h),
                  Align(
                    alignment: Alignment.center,
                    child: CustomFieldText(
                      text: StringsManager.cantEditEmail,
                      color: Colors.red,
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
