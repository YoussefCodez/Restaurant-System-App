class OrderItemModel {
  final String userId;
  final String paymentMethod;
  final String mealId;
  final String mealName;
  final String mealImage;
  final String mealSize;
  final String mealType;
  final double? mealPrice;
  final String mealSpicey;
  final Set<String> mealToAdd;
  num orderItemTotalPrice;
  int orderItemQuantity;
  OrderItemModel({
    required this.mealId,
    required this.userId,
    required this.paymentMethod,
    required this.mealName,
    required this.mealImage,
    required this.mealSize,
    required this.mealType,
    required this.mealPrice,
    required this.mealSpicey,
    required this.mealToAdd,
    required this.orderItemTotalPrice,
    required this.orderItemQuantity,
  });

  Map<String, dynamic> toMap() {
    return {
      "mealId": mealId,
      "mealName": mealName,
      "mealImage": mealImage,
      "mealSize": mealSize,
      "mealType": mealType,
      "mealPrice": mealPrice,
      "mealSpicey": mealSpicey,
      "mealToAdd": mealToAdd.toList(),
      "orderItemTotalPrice": orderItemTotalPrice,
      "orderItemQuantity": orderItemQuantity,
    };
  }
}
