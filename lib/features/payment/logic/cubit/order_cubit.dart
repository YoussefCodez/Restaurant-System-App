import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant/features/payment/data/order_item_model.dart';
import 'package:restaurant/features/payment/data/repositories/firebase_order_repo.dart';
import 'package:restaurant/features/payment/data/repositories/order_repo.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  final OrderRepo orderRepo = FirebaseOrderRepo();

  Future<void> placeOrder(List<OrderItemModel> items , String userId) async {
    emit(OrderLoading());
    try {
      await orderRepo.placeOrder(items , userId);
      emit(OrderSuccess());
    } catch (e) {
      emit(OrderFailure(error: e.toString()));
    }
  }
}
