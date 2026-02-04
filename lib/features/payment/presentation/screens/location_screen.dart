import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:restaurant/core/services/hive_service.dart';
import 'package:restaurant/core/theme/color_manager.dart';
import 'package:restaurant/core/utils/constants/strings_manager.dart';
import 'package:restaurant/core/widgets/custom_button.dart';
import 'package:restaurant/core/widgets/custom_leading_button.dart';
import 'package:restaurant/core/widgets/my_dialog.dart';
import 'package:restaurant/features/auth/logic/cubit/auth_cubit.dart';
import 'package:restaurant/features/cart/logic/cubit/cart_cubit.dart';
import 'package:restaurant/features/payment/data/order_item_model.dart';
import 'package:restaurant/features/payment/logic/cubit/location_cubit.dart';
import 'package:restaurant/features/payment/logic/cubit/order_cubit.dart';
import 'package:restaurant/features/payment/logic/cubit/payment_select_cubit.dart';
import 'package:restaurant/features/payment/presentation/widgets/complete_order_dialog.dart';
import 'package:restaurant/features/payment/presentation/widgets/governorate_selector.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late TextEditingController addressController;
  late TextEditingController phoneController;
  final List<String> locations = [
    "Cairo",
    "Giza",
    "Alexandria",
    "Dakahlia",
    "Beheira",
    "Monufia",
    "Sharqia",
    "Gharbia",
    "Qalyubia",
    "Fayoum",
    "Beni Suef",
    "Minya",
    "Assiut",
    "Sohag",
    "Qena",
    "Luxor",
    "Aswan",
    "Suez",
    "Port Said",
    "Damietta",
    "Ismailia",
    "North Sinai",
    "South Sinai",
    "Matrouh",
    "New Valley",
    "Red Sea",
  ]..sort();

  @override
  void initState() {
    addressController = .new();
    phoneController = .new();
    addressController.text = HiveService().getCachedUserAddress() ?? "";
    phoneController.text = HiveService().getCachedUserPhone() ?? "";
    super.initState();
  }

  @override
  void dispose() {
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomLeadingButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Location",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            GovernorateSelector(
              locations: locations,
              initialValue: HiveService().getCachedUserGovernorate() ?? "Cairo",
            ),
            Gap(24.h),
            Text(
              "Address",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            Gap(16.h),
            TextField(
              controller: addressController,
              cursorColor: ColorsManager.primary,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              decoration: InputDecoration(
                hint: Text(
                  "Enter Your Address..",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ),
            Gap(24.h),
            Text(
              "Phone Number",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            Gap(16.h),
            TextField(
              controller: phoneController,
              maxLength: 11,
              keyboardType: .phone,
              cursorColor: ColorsManager.primary,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              decoration: InputDecoration(
                hint: Text(
                  "Enter Your Phone Number..",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ),
            const Spacer(),
            BlocBuilder<OrderCubit, OrderState>(
              builder: (context, order) {
                return BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, auth) {
                    return GestureDetector(
                      onTap: () async {
                        if (addressController.text.isNotEmpty &&
                            phoneController.text.isNotEmpty) {
                          if (!RegExp(
                            r'^01[0125][0-9]{8}$',
                          ).hasMatch(phoneController.text)) {
                            showDialog(
                              context: context,
                              builder: (_) =>
                                  myDialog(message: "Invalid Phone Number"),
                            );
                            return;
                          }
                          final auth = context.read<AuthCubit>().state;
                          if (auth is! UserLoaded) return;
                          final cartItems = context.read<CartCubit>().state;
                          if (cartItems.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (_) =>
                                  myDialog(message: "Cart is empty"),
                            );
                            return;
                          }
                          final orderItems = cartItems.map((item) {
                            return OrderItemModel(
                              userId: auth.user.userId,
                              paymentMethod: context.read<PaymentSelectCubit>().state,
                              mealId: item.id,
                              mealName: item.name,
                              mealImage: item.image,
                              mealSize: item.size,
                              mealType: item.type,
                              mealPrice: item.price,
                              mealSpicey: item.spicey == 0 ? "Normal" : "Hot",
                              mealToAdd: item.toAdd,
                              orderItemTotalPrice: item.totalPrice,
                              orderItemQuantity: item.quantity,
                            );
                          }).toList();
                          await context.read<OrderCubit>().placeOrder(
                            orderItems,
                            auth.user.userId,
                          );
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => CompleteOrderDialog(),
                          );
                          final newUser = auth.user.copyWith(
                            address: addressController.text,
                            phone: phoneController.text,
                            governorate: context.read<LocationCubit>().state,
                          );
                          context.read<AuthCubit>().updateUserData(newUser);
                          HiveService().cacheUserAddress(
                            addressController.text,
                          );
                          HiveService().cacheUserPhone(phoneController.text);
                          HiveService().cacheUserGovernorate(
                            context.read<LocationCubit>().state,
                          );
                          context.read<CartCubit>().clearCart();
                        }
                      },
                      child: order is OrderLoading
                          ? const Center(child: CupertinoActivityIndicator())
                          : CustomButton(text: StringsManager.goToPayment),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
