class FavouriteItemModel {
  final String categoryId;
  final String name;
  final String id;
  final String image;
  final bool isActive;
  final bool hasDiscount;
  final double? price;
  final double? rate;
  final double? discount;
  FavouriteItemModel({
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


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'category': categoryId,
      'price': price,
    };
  }

  factory FavouriteItemModel.fromMap(Map<String, dynamic> map) {
    return FavouriteItemModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      categoryId: map['category'] ?? '',
      price: (map['price'] as num?)?.toDouble(),
      discount: (map['discount'] as num?)?.toDouble(),
      rate: (map['rate'] as num?)?.toDouble(),
      hasDiscount: map['hasDiscount'] ?? false,
      isActive: map['isActive'] ?? false,
    );
  }
}
