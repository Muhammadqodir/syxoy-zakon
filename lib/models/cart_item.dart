import 'package:suxoy_zakon/models/menu_item.dart';

class CartItem {
  MenuItem item;
  int count;

  CartItem({required this.item, required this.count});

  Map<String, dynamic> toJson() => {
        'count': count,
        'item': item.toJson(),
      };
}
