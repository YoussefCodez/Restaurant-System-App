import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant/features/home/data/models/category_model.dart';
import 'package:restaurant/features/home/data/repositories/category_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo repo;
  List<CategoryModel>? cachedCategory;
  CategoryCubit(this.repo) : super(CategoryInitial());

  void loadCategories() async {
    emit(CategoryLoading());
    try {
      if (cachedCategory != null && cachedCategory!.isNotEmpty) {
        emit(CategoriesLoaded(categories: cachedCategory!));
        return;
      }
      final categories = await repo.getCategory();
      cachedCategory = categories;
      emit(CategoriesLoaded(categories: categories));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}
