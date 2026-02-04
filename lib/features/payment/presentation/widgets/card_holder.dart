import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:restaurant/core/theme/color_manager.dart';
import 'package:restaurant/features/add_card/data/entities/credit_card_entity.dart';
import 'package:restaurant/features/payment/logic/cubit/credit_cards_cubit.dart';

class CardHolder extends StatelessWidget {
  const CardHolder({super.key, required this.card});

  final CreditCardEntity card;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: ColorsManager.holderColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                card.cardNumber.startsWith("51") ||
                        card.cardNumber.startsWith("52") ||
                        card.cardNumber.startsWith("55") ||
                        card.cardNumber.startsWith("54")
                    ? "Master Card"
                    : "Visa",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Gap(10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (card.cardNumber.startsWith("5") ||
                      card.cardNumber.startsWith("2"))
                    SvgPicture.asset(
                      "assets/svg/masterCard.svg",
                      width: 41.w,
                      height: 21.h,
                    )
                  else
                    SvgPicture.asset(
                      "assets/svg/visa.svg",
                      width: 15.w,
                      height: 15.h,
                    ),
                  Gap(10.w),
                  Text(
                    "**** **** **** ${card.cardNumber.substring(card.cardNumber.length - 4)}",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              context.read<CreditCardsCubit>().deleteCard(card.cardNumber);
              print(card.cardNumber);
            },
            child: Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Icon(Icons.delete, color: Colors.white, size: 25.sp),
            ),
          ),
        ],
      ),
    );
  }
}
