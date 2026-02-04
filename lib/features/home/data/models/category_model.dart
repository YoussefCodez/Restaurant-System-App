class CategoryModel {
  final String id;
  final String name;
  final String image;
  final int order;
  final bool isActive;
  CategoryModel({
    required this.id,
    required this.name,
    required this.isActive,
    required this.image,
    required this.order,
  });
  factory CategoryModel.fromMap(Map<String, dynamic> map, [String? docId]) {
    return CategoryModel(
      id: docId ?? map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      isActive: map['isActive'] ?? false,
      order: (map['order'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'isActive': isActive,
      'order': order,
    };
  }
}
