import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant/features/payment/data/models/order_model.dart';
import 'package:restaurant/features/payment/data/repositories/order_repo.dart';

class FirebaseOrderRepo implements OrderRepo {
  @override
  Future<void> placeOrder(OrderModel order) async {
    await FirebaseFirestore.instance.collection("orders").doc(order.orderId).set({
      "userId": order.userId,
      "orderId": order.orderId,
      "orderedAt": order.orderedAt,
      "status": order.status,
      "deliveryTime": order.deliveryTime,
      "totalOrderPrice": order.totalOrderPrice,
      "paymentMethod": order.paymentMethod,
      "items": order.items.map((e) => e.toMap()).toList(),
    });
  }

  @override
  Stream<List<OrderModel>> getOrders(String userId) {
    return FirebaseFirestore.instance
        .collection("orders")
        .where("userId", isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
          final orders = snapshot.docs
              .map((doc) => OrderModel.fromDocument(doc.data()))
              .toList();
          orders.sort((a, b) => b.orderedAt.compareTo(a.orderedAt));
          return orders;
        });
  }
}
