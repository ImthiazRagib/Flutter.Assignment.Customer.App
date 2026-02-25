import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
      {"title": "AI Essay", "status": "In Progress"},
      {"title": "Marketing Case Study", "status": "Completed"},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.canPop() ? context.pop() : context.go('/'),
        ),
        title: const Text("My Orders"),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(orders[index]["title"]!),
          subtitle: Text("Status: ${orders[index]["status"]}"),
        ),
      ),
    );
  }
}