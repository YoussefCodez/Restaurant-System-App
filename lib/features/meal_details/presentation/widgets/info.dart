import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/constants/strings_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:restaurant/core/utils/constants/assets_manager.dart';
import 'package:restaurant/features/home/data/models/menu_model.dart';
import 'package:restaurant/features/meal_details/presentation/widgets/details_info.dart';

class Info extends StatelessWidget {
  const Info({super.key, required this.menuModel});

  final MenuModel menuModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DetailsInfo(text: menuModel.rate.toString(), svg: AssetsManager.rate),
        Gap(35.w),
        DetailsInfo(text: StringsManager.free, svg: AssetsManager.delivery),
        Gap(35.w),
        DetailsInfo(
          text: StringsManager.deliveryTime,
          svg: AssetsManager.clock,
        ),
      ],
    );
  }
}
