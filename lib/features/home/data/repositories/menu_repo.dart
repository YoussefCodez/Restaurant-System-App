import 'package:restaurant/features/home/data/models/menu_model.dart';

abstract class MenuRepo {
  Future<List<MenuModel>> getMenuByCategory(String categoryId);
  Future<List<MenuModel>> getMenu();
}
