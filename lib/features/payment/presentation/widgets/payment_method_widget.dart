import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:restaurant/core/utils/constants/strings_manager.dart';
import 'package:restaurant/features/payment/logic/cubit/payment_select_cubit.dart';
import 'package:restaurant/features/payment/presentation/widgets/method_widget.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSelectCubit, String>(
      builder: (context, state) {
        return Row(
          children: [
            MethodWidget(
              text: StringsManager.cash,
              svg: "assets/svg/cash.svg",
              onTap: () {
                context.read<PaymentSelectCubit>().selectPayment(
                  StringsManager.cash,
                );
              },
              isSelected: state == StringsManager.cash,
            ),
            Gap(16.w),
            MethodWidget(
              text: StringsManager.creditCard,
              svg: "assets/svg/masterCard.svg",
              onTap: () {
                context.read<PaymentSelectCubit>().selectPayment(
                  StringsManager.creditCard,
                );
              },
              isSelected: state == StringsManager.creditCard,
            ),
          ],
        );
      },
    );
  }
}
