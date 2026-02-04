import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:restaurant/core/theme/color_manager.dart';
import 'package:restaurant/core/utils/constants/strings_manager.dart';
import 'package:restaurant/core/widgets/custom_unfilled_button.dart';
import 'package:restaurant/features/add_card/presentation/screens/add_card_screen.dart';

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
return Column(
      crossAxisAlignment: .center,
      children: [ 
        Gap(25.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(30.r),
          decoration: BoxDecoration(
            color: ColorsManager.holderColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              Image.asset(
                "assets/images/card.png",
                width: 200.w,
                height: 120.h,
              ),
              Gap(25.h),
              Text(
                StringsManager.noCreditCard,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: .w700,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSecondaryContainer,
                ),
              ),
              Gap(6.h),
              Text(
                StringsManager.addCreditCard,
                textAlign: .center,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: .w300,
                  color: const Color(0xFF2D2D2D),
                ),
              ),
            ],
          ),
        ),
        Gap(15.h),  
        CustomUnfilledButton(
          text: StringsManager.addNew,
          isIcon: true,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddCardScreen()));
          },
        ),
      ],
    );
  }
}