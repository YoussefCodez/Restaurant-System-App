import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant/features/home/data/models/menu_model.dart';
import 'package:restaurant/features/home/data/repositories/menu_repo.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final MenuRepo repo;
  List<MenuModel>? cachedMenu;
  MenuCubit(this.repo) : super(MenuInitial());

  void loadMenu() async {
    emit(MenuLoading());
    try {
      if (cachedMenu != null) {
        emit(MenuSuccess(menu: cachedMenu!));
        return;
      }
      final menu = await repo.getMenu();
      cachedMenu = menu;
      emit(MenuSuccess(menu: menu));
    } catch (e) {
      emit(MenuError(message: e.toString()));
    }
  }

  void loadMenuByCategory(String categoryId) async {
    try {
      emit(MenuLoading());
      final menu = cachedMenu
          ?.where((element) => element.categoryId.toLowerCase() == categoryId.toLowerCase())
          .toList();
      emit(MenuSuccess(menu: menu!));
    } catch (e) {
      emit(MenuError(message: e.toString()));
    }
  }

  void loadMenuByDiscount() async {
    try {
      emit(MenuLoading());
      final menu = cachedMenu?.where((element) => element.hasDiscount == true).toList();
      emit(MenuSuccess(menu: menu!));
    } catch (e) {
      emit(MenuError(message: e.toString()));
    }
  }

  void loadMenuBySearch(String search) {
    try {
      emit(MenuLoading());
      final menu = cachedMenu?.where((element) => element.name.toLowerCase().contains(search.toLowerCase())).toList();
      emit(MenuSuccess(menu: menu!));
    } catch (e) {
      emit(MenuError(message: e.toString()));
    }
  }

  void loadMenuExcept(String categoryId , String id) async {
    try {
      emit(MenuLoading());
      final menu = cachedMenu
          ?.where((element) => element.categoryId.toLowerCase() == categoryId.toLowerCase())
          .where((element) => element.id != id)
          .toList();
      emit(MenuSuccess(menu: menu!));
    } catch (e) {
      emit(MenuError(message: e.toString()));
    }
  }
}
