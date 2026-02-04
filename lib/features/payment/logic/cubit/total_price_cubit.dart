import 'package:bloc/bloc.dart';

class TotalPriceCubit extends Cubit<num> {
  TotalPriceCubit() : super(0);
  num price = 0;
  void updateTotalPrice(num totalPrice) {
    price += totalPrice;
    emit(price);
  }
  void resetTotalPrice() {
    price = 0;
    emit(price);
  }
}
