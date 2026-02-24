import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment Solutions"),
        backgroundColor: Colors.amberAccent,
        // actions: [
        //   TextButton(onPressed: () => context.go('/about'), child: const Text("About")),
        //   TextButton(onPressed: () => context.go('/services'), child: const Text("Services")),
        //   TextButton(onPressed: () => context.go('/order'), child: const Text("Order")),
        //   TextButton(onPressed: () => context.go('/login'), child: const Text("Login")),
        // ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
          Text("Welcome to Assignment Solutions", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text("Assignment Solutions is a platform for students to get help with their assignments.", style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.amber.shade100, Colors.amber.shade200],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              "Get expert help with your assignments — fast & reliable",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.brown.shade800,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.go('/order'),
            child: Text("Place Order"),
          ),
        ],
        ),
      ),
    );
  }
}