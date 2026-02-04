import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:restaurant/core/utils/constants/strings_manager.dart';
import 'package:restaurant/core/services/hive_service.dart';
import 'package:restaurant/core/widgets/custom_button.dart';
import 'package:restaurant/core/widgets/custom_leading_button.dart';
import 'package:restaurant/features/add_card/data/entities/credit_card_entity.dart';
import 'package:restaurant/features/add_card/logic/cubit/add_card_cubit.dart';
import 'package:restaurant/features/payment/logic/cubit/credit_cards_cubit.dart';
import 'package:restaurant/core/widgets/my_dialog.dart';

class AddCardScreen extends StatelessWidget {
  AddCardScreen({super.key});

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCardCubit, AddCardState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: CustomLeadingButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              StringsManager.addCard,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                CreditCardWidget(
                  cardNumber: state.cardNumber,
                  expiryDate: state.expiryDate,
                  cardHolderName: state.cardHolderName,
                  cvvCode: state.cvvCode,
                  showBackView: state.isShow,
                  isSwipeGestureEnabled: true,
                  isHolderNameVisible: true,
                  obscureCardCvv: true,
                  cardBgColor: Theme.of(context).colorScheme.onSurface,
                  onCreditCardWidgetChange:
                      (CreditCardBrand creditCardBrand) {},
                ),
                CreditCardForm(
                  formKey: _key,
                  cardNumber: state.cardNumber,
                  expiryDate: state.expiryDate,
                  cardHolderName: state.cardHolderName,
                  cvvCode: state.cvvCode,
                  onCreditCardModelChange: (CreditCardModel creditCardModel) {
                    context.read<AddCardCubit>().updateCardModel(
                      creditCardModel,
                    );
                  },
                ),
                Gap(120.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: GestureDetector(
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        final entity = CreditCardEntity(
                          cardNumber: state.cardNumber,
                          expiryDate: state.expiryDate,
                          cardHolderName: state.cardHolderName,
                          cvvCode: state.cvvCode,
                          isShow: state.isShow,
                        );
                        final isExist = HiveService()
                            .getCachedCreditCards()
                            .any(
                              (card) => card.cardNumber == entity.cardNumber,
                            );
                        if (!isExist) {
                          final cards = HiveService().getCachedCreditCards();
                          if (cards.length < 3) {
                            cards.add(entity);
                            HiveService().cacheCreditCards(cards);
                            Navigator.pop(context);
                          } else {
                            showDialog(
                              context: context,
                              builder: (_) => myDialog(
                                message: StringsManager.onlyThreeCards,
                              ),
                            );
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) =>
                                myDialog(message: StringsManager.cardExists),
                          );
                        }
                        context.read<CreditCardsCubit>().loadCards();
                      }
                    },
                    child: CustomButton(
                      text: StringsManager.addCreditCardButton,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
