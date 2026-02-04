import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/core/theme/color_manager.dart';
import 'package:restaurant/core/utils/constants/assets_manager.dart';
import 'package:restaurant/core/utils/responsive/device_utils.dart';
import 'package:restaurant/features/favourites/data/models/favourite_item_model.dart';
import 'package:restaurant/features/favourites/logic/cubit/favourite_item_cubit.dart';
import 'package:restaurant/features/home/data/models/menu_model.dart';
import 'package:restaurant/features/meal_details/logic/cubit/favourite_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.menuModel});

  final MenuModel menuModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: DeviceUtils.isTablet(context) ? 600.h : 350.h,
      toolbarHeight: DeviceUtils.isTablet(context) ? 100.h : 50.h,
      pinned: true,
      stretch: true,
      backgroundColor: Theme.of(context).colorScheme.onSecondaryFixedVariant,
      leadingWidth: 50.w,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: DeviceUtils.isTablet(context) ? 30.r : 25.r,
          ),
        ),
      ),
      actions: [
        BlocBuilder<FavouriteCubit, List<String>>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                final favCubit = context.read<FavouriteCubit>();
                final favItemCubit = context.read<FavouriteItemCubit>();
                favCubit.addToFavourites(menuModel.id);
                if (favCubit.state.contains(menuModel.id)) {
                  favItemCubit.addToFavourites(
                    FavouriteItemModel(
                      id: menuModel.id,
                      name: menuModel.name,
                      image: menuModel.image,
                      categoryId: menuModel.categoryId,
                      price: menuModel.price,
                      discount: menuModel.discount,
                      rate: menuModel.rate,
                      hasDiscount: menuModel.hasDiscount,
                      isActive: menuModel.isActive,
                    ),
                  );
                } else {
                  favItemCubit.removeFromFavourites(menuModel.id);
                }
              },
              child: Container(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  state.contains(menuModel.id)
                      ? AssetsManager.favourite
                      : AssetsManager.emptyFavourite,
                  colorFilter: ColorFilter.mode(
                    state.contains(menuModel.id)
                        ? ColorsManager.primary
                        : Theme.of(context).colorScheme.onSecondaryContainer,
                    BlendMode.srcIn,
                  ),
                  width: DeviceUtils.isTablet(context) ? 25.w : 20.w,
                  height: DeviceUtils.isTablet(context) ? 25.h : 20.h,
                ),
              ),
            );
          },
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          menuModel.name,
          maxLines: 1,
          overflow: .ellipsis,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: .bold,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        background: Padding(
          padding: EdgeInsets.all(40.r),
          child: CachedNetworkImage(
            imageUrl: menuModel.image,
            placeholder: (context, url) => Skeletonizer(
              child: Container(width: 250.w, height: 250.h, color: Colors.grey),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
            width: 250.w,
            height: 250.h,
          ),
        ),
      ),
    );
  }
}
