import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/constants/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/widgets/custom_button.dart';
import 'package:restaurant/features/payment/logic/cubit/credit_cards_cubit.dart';
import 'package:restaurant/features/payment/logic/cubit/payment_select_cubit.dart';
import 'package:restaurant/core/widgets/my_dialog.dart';
import 'package:restaurant/features/payment/presentation/screens/location_screen.dart';

class PayButton extends StatelessWidget {
  const PayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (context.read<PaymentSelectCubit>().state == StringsManager.creditCard &&
            context.read<CreditCardsCubit>().state.isEmpty) {
          showDialog(
            context: context,
            builder: (context) {
              return myDialog(
                message:
                    StringsManager.addCardFirst,
              );
            },
          );
        } else if (context.read<PaymentSelectCubit>().state == StringsManager.creditCard &&
          context.read<CreditCardsCubit>().state.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LocationScreen(),
            ),
          );
        } else if (context.read<PaymentSelectCubit>().state == StringsManager.cash) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LocationScreen(),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return myDialog(
                message:
                    StringsManager.selectPaymentMethod,
              );
            },
          );
        }
      },
      child: CustomButton(text: StringsManager.payAndConfirm),
    );
  }
}
