import 'package:bloc/bloc.dart';
import 'package:restaurant/core/services/hive_service.dart';
import 'package:restaurant/features/add_card/data/entities/credit_card_entity.dart';

class CreditCardsCubit extends Cubit<List<CreditCardEntity>> {
  CreditCardsCubit() : super([]) {
    loadCards();
  }

  void loadCards() {
    final cards = HiveService().getCachedCreditCards();
    emit(cards);
  }

  void deleteCard(String cardNumber) {
    HiveService().deleteCreditCard(cardNumber);
    loadCards();
  }
}

