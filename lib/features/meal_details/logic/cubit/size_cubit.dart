import 'package:bloc/bloc.dart';

class SizeCubit extends Cubit<int> {
  SizeCubit() : super(0);

  void select(int index) {
    emit(index);
  }
}
