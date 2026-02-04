
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:restaurant/core/theme/color_manager.dart';
import 'package:restaurant/features/payment/logic/cubit/location_cubit.dart';

class GovernorateSelector extends StatefulWidget {
  const GovernorateSelector({
    super.key,
    required this.locations,
    required this.initialValue,
  });

  final List<String> locations;
  final String initialValue;

  @override
  State<GovernorateSelector> createState() => _GovernorateSelectorState();
}

class _GovernorateSelectorState extends State<GovernorateSelector> {
  void initState() {
    context.read<LocationCubit>().setLocation(widget.initialValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Governorate",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        Gap(16.w),
        Icon(Icons.location_on, color: ColorsManager.primary),
        const Spacer(),
        BlocBuilder<LocationCubit, String>(
          builder: (context, state) {
            return DropdownButton(
              value: state,
              menuWidth: double.infinity,
              menuMaxHeight: 400.h,
              items: widget.locations.map((location) {
                return DropdownMenuItem(
                  value: location,
                  child: Text(location),
                );
              }).toList(),
              onChanged: (value) {
                context.read<LocationCubit>().setLocation(value!);
              },
            );
          },
        ),
      ],
    );
  }
}
