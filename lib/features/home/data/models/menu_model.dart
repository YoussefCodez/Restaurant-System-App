class MenuModel {
  final String categoryId;
  final String name;
  final String id;
  final String image;
  final bool isActive;
  final bool hasDiscount;
  final double? price;
  final double? rate;
  final double? discount;
  MenuModel({
    required this.categoryId,
    required this.name,
    required this.id,
    required this.image,
    required this.isActive,
    required this.price,
    required this.hasDiscount,
    required this.rate,
    required this.discount,
  });

  factory MenuModel.fromMap(Map<String, dynamic> map, String? docId) {
    return MenuModel(
      categoryId: map['categoryId'] ?? '',
      name: map['name'] ?? "",
      id: docId ?? map['id'] ?? '',
      image: map['image'] ?? "",
      isActive: map['isActive'] ?? false,
      hasDiscount: map['hasDiscount'] ?? false,
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      discount: (map['discount'] as num?)?.toDouble() ?? 0.0,
      rate: (map['rate'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'name': name,
      'image': image,
      'isActive': isActive,
      'hasDiscount': hasDiscount,
      'price': price,
      'discount': discount,
      'rate': rate,
    };
  }
}
