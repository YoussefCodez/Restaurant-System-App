import 'package:restaurant/features/payment/data/order_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant/features/payment/data/repositories/order_repo.dart';

class FirebaseOrderRepo implements OrderRepo {
  @override
  Future<void> placeOrder(List<OrderItemModel> items , String userId) async {
  await FirebaseFirestore.instance.collection("orders").add({
    "userId": userId,
    "orderedAt": DateTime.now(),
    "items": items.map((e) => e.toMap()).toList(),
    "totalOrderPrice": items.fold(
        0,
        (num sum, item) => sum + item.orderItemTotalPrice,
      ),
  });
}

}