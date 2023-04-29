import 'package:suxoy_zakon/models/cart_item.dart';
import 'package:suxoy_zakon/widgets/destination_selector.dart';

class Order {
  final int id;
  final String status;
  final String date;
  final String note;
  final String paymentMethod;
  final Destination delivery;
  final String price;
  final List<CartItem> items;

  Order({
    required this.id,
    required this.status,
    required this.date,
    required this.note,
    required this.paymentMethod,
    required this.delivery,
    required this.price,
    required this.items,
  });
  
}
