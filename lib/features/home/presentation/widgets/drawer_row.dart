import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/core/utils/responsive/device_utils.dart';

class DrawerRow extends StatelessWidget {
  const DrawerRow({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon
  });
  final String text;
  final IconData icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.all(DeviceUtils.isTablet(context) ? 23.r : 16.r),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.onSecondaryContainer, size: DeviceUtils.isTablet(context) ? 23.w : 20.w ),
            Expanded(
              child: Text(
                text,
                textAlign: .end,
                style: TextStyle(
                  fontSize: DeviceUtils.isTablet(context) ? 18.sp : 20.sp,
                  fontWeight: .w800,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
