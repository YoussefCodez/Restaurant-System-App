class CartItemModel {
  final String id;
  final String name;
  final String image;
  final String size;
  final double? price;
  final int spicey;
  final Set<String> toAdd;
  final String type;
  num totalPrice;
  int quantity;
  CartItemModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.size,
    required this.spicey,
    required this.toAdd,
    required this.totalPrice,
    required this.type,
  });
}
