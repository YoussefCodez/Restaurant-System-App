import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/core/utils/constants/assets_manager.dart';
import 'package:restaurant/core/utils/constants/strings_manager.dart';
import 'package:restaurant/features/meal_details/logic/cubit/selected_item.dart';
import 'package:restaurant/features/meal_details/presentation/widgets/to_add_item.dart';

class ToAdd extends StatelessWidget {
  const ToAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedItem, Set<String>>(
      builder: (context, state) {
        return Wrap(
          spacing: 20.w,
          runSpacing: 26.h,
          children: [
            _buildItem(context, AssetsManager.salt, StringsManager.salt, state),
            _buildItem(
              context,
              AssetsManager.peppers,
              StringsManager.peppers,
              state,
            ),
            _buildItem(
              context,
              AssetsManager.ginger,
              StringsManager.ginger,
              state,
            ),
            _buildItem(
              context,
              AssetsManager.broccoli,
              StringsManager.broccoli,
              state,
            ),
            _buildItem(
              context,
              AssetsManager.lemon,
              StringsManager.lemon,
              state,
            ),
            _buildItem(
              context,
              AssetsManager.onion,
              StringsManager.onion,
              state,
            ),
          ],
        );
      },
    );
  }

  Widget _buildItem(
    BuildContext context,
    String svg,
    String text,
    Set<String> state,
  ) {
    return ToAddItem(
      svg: svg,
      text: text,
      isSelected: state.contains(text),
      onTap: () => context.read<SelectedItem>().toggle(text, state.length),
    );
  }
}
