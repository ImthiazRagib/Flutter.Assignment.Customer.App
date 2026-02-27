import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'order_form.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.canPop() ? context.pop() : context.go('/'),
        ),
        title: const Text("Place an order"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: OrderForm(),
      ),
    );
  }
}