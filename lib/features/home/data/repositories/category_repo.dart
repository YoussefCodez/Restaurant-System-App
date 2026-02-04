import 'package:restaurant/features/home/data/models/category_model.dart';

abstract class CategoryRepo {
  Future<List<CategoryModel>> getCategory();
}