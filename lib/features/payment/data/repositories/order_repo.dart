import 'package:restaurant/features/payment/data/order_item_model.dart';

abstract class OrderRepo {
  Future<void> placeOrder(List<OrderItemModel> items , String userId);
}