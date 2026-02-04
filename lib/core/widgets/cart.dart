
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/core/utils/responsive/device_utils.dart';
import 'package:restaurant/features/cart/data/models/cart_item_model.dart';
import 'package:restaurant/features/cart/logic/cubit/cart_cubit.dart';
import 'package:restaurant/features/cart/presentation/screens/cart_screen.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
    required this.color,
  });

  final ColorScheme color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartScreen()),
        );
      },
      child: Container(
        width: DeviceUtils.isTablet(context) ? 45.w : 45.w,
        height: DeviceUtils.isTablet(context) ? 70.h : 45.h,
        padding: EdgeInsets.all(11.r),
        alignment: .center,
        decoration: BoxDecoration(
          color: color.onPrimaryFixedVariant,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Stack(
          clipBehavior: .none,
          children: [
            SvgPicture.asset(
              "assets/svg/cart.svg",
              width: 25.w,
              height: 25.h,
              colorFilter: ColorFilter.mode(
                color.onPrimaryContainer,
                BlendMode.srcIn,
              ),
            ),
            Positioned(
              top: DeviceUtils.isTablet(context) ? -35.h : -18.h,
              right: DeviceUtils.isTablet(context) ? -45.h : -18.w,
              child: Container(
                width: DeviceUtils.isTablet(context) ? 30.w : 25.w,
                height: DeviceUtils.isTablet(context) ? 45.h : 25.h,
                alignment: .center,
                decoration: BoxDecoration(
                  color: color.onSecondary,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: BlocBuilder<CartCubit, List<CartItemModel>>(
                  builder: (context, state) {
                    return Text(
                      state.length.toString(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: .w900,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
