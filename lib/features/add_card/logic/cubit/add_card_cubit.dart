import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
part 'add_card_state.dart';

class AddCardCubit extends Cubit<AddCardState> {
  AddCardCubit() : super(AddCardState.initial());
  void updateCardModel(CreditCardModel creditCardModel) {
    emit(
      state.copyWith(
        cardNumber: creditCardModel.cardNumber,
        expiryDate: creditCardModel.expiryDate,
        cardHolderName: creditCardModel.cardHolderName,
        cvvCode: creditCardModel.cvvCode,
        isShow: creditCardModel.isCvvFocused,
      ),
    );
  }
}
