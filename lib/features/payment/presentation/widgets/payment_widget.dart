import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:restaurant/core/widgets/custom_unfilled_button.dart';
import 'package:restaurant/core/utils/constants/strings_manager.dart';
import 'package:restaurant/features/add_card/data/entities/credit_card_entity.dart';
import 'package:restaurant/features/add_card/presentation/screens/add_card_screen.dart';
import 'package:restaurant/features/payment/logic/cubit/credit_cards_cubit.dart';
import 'package:restaurant/features/payment/logic/cubit/payment_select_cubit.dart';
import 'package:restaurant/features/payment/presentation/widgets/card_holder.dart';
import 'package:restaurant/features/payment/presentation/widgets/credit_card_widget.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSelectCubit, String>(
      builder: (context, paymentMethod) {
        if (paymentMethod == StringsManager.creditCard) {
          return BlocBuilder<CreditCardsCubit, List<CreditCardEntity>>(
            builder: (context, cards) {
              if (cards.isEmpty) {
                return const CreditCardWidget();
              }
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        final card = cards[index];
                        return CardHolder(card: card);
                      },
                    ),
                    Gap(10.h),
                    CustomUnfilledButton(
                      text: StringsManager.addNew,
                      isIcon: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => AddCardScreen()),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
