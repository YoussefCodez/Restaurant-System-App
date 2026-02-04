import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/core/utils/constants/assets_manager.dart';
import 'package:restaurant/core/utils/constants/strings_manager.dart';
import 'package:restaurant/core/utils/responsive/device_utils.dart';
import 'package:restaurant/features/favourites/presentation/screens/favourites_screen.dart';
import 'package:restaurant/features/home/presentation/widgets/drawer_row.dart';
import 'package:restaurant/features/offers/presentation/screens/offers_screen.dart';
import 'package:restaurant/features/settings/presentation/screens/settings_screen.dart';
import 'package:restaurant/features/track_order/presentation/screens/track_order_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300.w,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              AssetsManager.logo,
              width: DeviceUtils.isTablet(context) ? 120.w : 150.w,
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  DrawerRow(
                    text: StringsManager.orders,
                    icon: Icons.shopping_cart,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TrackOrderScreen(),
                        ),
                      );
                    },
                  ),
                  DrawerRow(
                    text: StringsManager.favourites,
                    icon: Icons.favorite,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavouritesScreen(),
                        ),
                      );
                    },
                  ),
                  DrawerRow(text: StringsManager.offers, icon: Icons.discount, onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OffersScreen(),
                      ),
                    );
                  }),
                  DrawerRow(
                    text: StringsManager.settings,
                    icon: Icons.settings,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
