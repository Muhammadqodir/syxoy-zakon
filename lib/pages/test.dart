import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return StickyHeader(
        header: Container(
          height: 50.0,
          color: Colors.blueGrey[700],
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          child: Text('Header #$index',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        content: Container(
          child: Image.network(
            "https://suxoyzakon.ru/assets/header.jpeg", 
            fit: BoxFit.cover,
            width: double.infinity, 
            height: 200.0,
          ),
        ),
      );
    });

  }
}
