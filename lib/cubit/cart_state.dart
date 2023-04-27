part of 'cart_cubit.dart';


class CartState {
  List<CartItem> items = [];
  CartState(this.items);

  int getCount(int id){
    for (CartItem item in items) {
      if(item.item.id == id){
        return item.count;
      }
    }
    return 0;
  }

  int getAllCount(){
    int res = 0;
    for (CartItem item in items) {
      res += item.count;
    }
    return res;
  }

  int getTotalPrice(){
    int res = 0;
    for (CartItem item in items) {
      res += item.count * int.parse(item.item.price);
    }
    return res;
  }
}