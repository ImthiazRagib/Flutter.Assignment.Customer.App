import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FloatingNavBar extends StatelessWidget {
  const FloatingNavBar({super.key});

  static const _color = Color(0xFF13245A);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 16,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(999),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: _color, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                onPressed: () => context.go('/'),
                icon: Icon(Icons.home, size: 20, color: _color),
                label: Text("Home", style: TextStyle(color: _color, fontSize: 12)),
              ),
              TextButton.icon(
                onPressed: () => context.go('/order'),
                icon: Icon(Icons.add_circle_outline, size: 20, color: _color),
                label: Text("Order Now", style: TextStyle(color: _color, fontSize: 12)),
              ),
              TextButton.icon(
                onPressed: () => context.go('/profile'),
                icon: Icon(Icons.person_outline, size: 20, color: _color),
                label: Text("Profile", style: TextStyle(color: _color, fontSize: 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
