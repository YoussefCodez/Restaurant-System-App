import 'package:bloc/bloc.dart';
import 'package:restaurant/core/services/hive_service.dart';
import 'package:restaurant/features/favourites/data/models/favourite_item_model.dart';

class FavouriteItemCubit extends Cubit<List<FavouriteItemModel>> {
  FavouriteItemCubit() : super(HiveService().getCachedFavouriteItems());

  void addToFavourites(FavouriteItemModel item) {
    final favourite = List<FavouriteItemModel>.from(state);
    if (!favourite.any((e) => e.id == item.id)) {
      favourite.add(item);
      HiveService().cacheFavouriteItems(favourite);
      emit(favourite);
    }
  }

  void removeFromFavourites(String id) {
    final favourite = state.where((e) => e.id != id).toList();
    HiveService().cacheFavouriteItems(favourite);
    emit(favourite);
  }
}
