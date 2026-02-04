import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant/core/services/hive_service.dart';
import 'package:restaurant/features/home/data/models/menu_model.dart';
import 'package:restaurant/features/home/data/repositories/menu_repo.dart';

class FirebaseMenuRepo implements MenuRepo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<List<MenuModel>> getMenuByCategory(String categoryId) async {
    final snapshot = await firestore
        .collection('menu')
        .where('categoryId', isEqualTo: categoryId)
        .limit(10) // 🔥 Optimized: Limit results for recommendations
        .get();
    return snapshot.docs
        .map((doc) => MenuModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  @override
  Future<List<MenuModel>> getMenu() async {
    final cachedMenu = HiveService().getCachedMenu();
    if (cachedMenu != null && cachedMenu.isNotEmpty) {
      return cachedMenu.map((e) => MenuModel.fromMap(e, e['id'])).toList();
    }
    final snapshot = await firestore.collection('menu').get();
    final menu = snapshot.docs
        .map((doc) => MenuModel.fromMap(doc.data(), doc.id))
        .toList();
    await HiveService().cacheMenu(menu.map((item) => item.toMap()).toList());
    return menu;
  }
}
