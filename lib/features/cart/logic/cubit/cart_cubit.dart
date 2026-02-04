import 'package:bloc/bloc.dart';
import 'package:restaurant/features/cart/data/models/cart_item_model.dart';

class CartCubit extends Cubit<List<CartItemModel>> {
  CartCubit() : super([]);
  void addToCart(CartItemModel item) {
    final cart = List<CartItemModel>.from(state);
    final existedIndex = cart.indexWhere(
      (element) =>
          element.id == item.id &&
          element.size == item.size &&
          element.spicey == item.spicey &&
          element.toAdd.join(',') == item.toAdd.join(','),
    );
    if (existedIndex != -1) {
      cart[existedIndex].quantity += item.quantity;
      cart[existedIndex].totalPrice += item.totalPrice;
    } else {
      cart.add(item);
    }
    emit(cart);
  }

  void removeFromCart(CartItemModel item) {
    final cart = List<CartItemModel>.from(state);
    cart.remove(item);
    emit(cart);
  }

  void clearCart() {
    emit([]);
  }
}
