import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant/core/services/hive_service.dart';
import 'package:restaurant/features/home/data/models/category_model.dart';
import 'package:restaurant/features/home/data/repositories/category_repo.dart';

class FirebaseCategoryRepo implements CategoryRepo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<List<CategoryModel>> getCategory() async {
    final cachedCategory = HiveService().getCachedCategory();
    if (cachedCategory != null && cachedCategory.isNotEmpty) {
      return cachedCategory.map((e) => CategoryModel.fromMap(e)).toList();
    }
    final snapshot = await firestore
        .collection('categories')
        .orderBy('order')
        .get();
    final categories = snapshot.docs
        .map((doc) => CategoryModel.fromMap(doc.data(), doc.id))
        .toList();
    await HiveService().cacheCategory(
      categories.map((e) => e.toMap()).toList(),
    );
    return categories;
  }
}
