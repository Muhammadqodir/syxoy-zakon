import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:suxoy_zakon/models/cart_item.dart';
import 'package:suxoy_zakon/models/menu_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([]));

  void addCart(MenuItem item) {
    List<CartItem> items = List.from(state.items);
    for (var element in items) {
      if (element.item.id == item.id) {
        element.count++;
        emit(CartState(items));
        return;
      }
    }
    items.add(CartItem(item: item, count: 1));
    emit(CartState(items));
  }

  void decCart(MenuItem item) {
    List<CartItem> items = List.from(state.items);
    for (var element in items) {
      if (element.item.id == item.id) {
        element.count--;
        if(element.count == 0){
          items.remove(element);
        }
        emit(CartState(items));
        return;
      }
    }
  }

  void clearCart(){
    List<CartItem> items = [];
    emit(CartState(items));
  }
}
