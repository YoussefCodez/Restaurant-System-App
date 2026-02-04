import 'package:bloc/bloc.dart';
import 'package:restaurant/core/services/hive_service.dart';

class FavouriteCubit extends Cubit<List<String>> {
  FavouriteCubit() : super(HiveService().getCachedState());
  void addToFavourites(String id) {
    final updated = List<String>.from(state);
    if (updated.contains(id)) {
      updated.remove(id);
    } else {
      updated.add(id);
    }
    HiveService().cacheState(updated);
    emit(updated);
  }
}
