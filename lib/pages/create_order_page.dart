import 'package:flutter/material.dart';
import 'package:massagex/pages/page_layout.dart';
import 'package:models/service.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({Key? key, required this.service}) : super(key: key);
  final Service service;
  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  @override
  Widget build(BuildContext context) {
    return const PageLayoutWidget(
      title: "Your service order",
      children: [],
    );
  }
}
