import 'package:flutter/material.dart';
import 'package:suxoy_zakon/api_master.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key, required this.api});

  final Api api;

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}