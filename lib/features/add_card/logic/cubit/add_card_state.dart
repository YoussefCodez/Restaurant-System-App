part of 'add_card_cubit.dart';

class AddCardState extends Equatable {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool isShow;

  const AddCardState({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.isShow,
  });

  factory AddCardState.initial() => const AddCardState(
    cardNumber: '',
    expiryDate: '',
    cardHolderName: '',
    cvvCode: '',
    isShow: false,
  );

  AddCardState copyWith({
    String? cardNumber,
    String? expiryDate,
    String? cardHolderName,
    String? cvvCode,
    bool? isShow,
  }) {
    return AddCardState(
      cardNumber: cardNumber ?? this.cardNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cvvCode: cvvCode ?? this.cvvCode,
      isShow: isShow ?? this.isShow,
    );
  }

  @override
  List<Object> get props => [
    cardNumber,
    expiryDate,
    cardHolderName,
    cvvCode,
    isShow,
  ];
}
