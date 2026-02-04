import 'package:bloc/bloc.dart';

class IndexCubit extends Cubit<int> {
  IndexCubit() : super(0);
  void changeIndex(int order) {
    int index;
    emit(index = order);
  }
}
