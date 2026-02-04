import 'package:bloc/bloc.dart';

class CountCubit extends Cubit<int> {
  CountCubit() : super(1);

  void increment() {
    if (state < 20) {
      emit(state + 1);
    }
  }

  void decrement() {
    if (state > 1) {
      emit(state - 1);
    }
  }

}
