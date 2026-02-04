import 'package:bloc/bloc.dart';


class IsSpiceyCubit extends Cubit<int> {
  IsSpiceyCubit() : super(0);

  void select(int index) {
    emit(index);
  }
}
