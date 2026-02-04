import 'package:bloc/bloc.dart';

class PaymentSelectCubit extends Cubit<String> {
  PaymentSelectCubit() : super("");
  void selectPayment(String payment) {
    emit(payment);
  }
}
