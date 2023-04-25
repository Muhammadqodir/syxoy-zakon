import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:suxoy_zakon/models/cart_item.dart';
import 'package:suxoy_zakon/models/menu_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([]));

  void addToCart(MenuItem item){
    List<CartItem> items = List.from(state.items);
    items.add(CartItem(item: item, count: 1));
    emit(CartState(items));
  }
}
