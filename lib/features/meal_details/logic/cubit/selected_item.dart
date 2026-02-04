import 'package:bloc/bloc.dart';

class SelectedItem extends Cubit<Set<String>> {
  SelectedItem() : super({});

  void toggle(String itemName, int number) {
    final updated = Set<String>.from(state);
    if (updated.contains(itemName)) {
      updated.remove(itemName);
    } else if (!updated.contains(itemName) && number < 2) {
      updated.add(itemName);
    }
    emit(updated);
  }
}
