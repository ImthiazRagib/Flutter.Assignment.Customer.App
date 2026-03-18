import 'package:assignment_customer_app/core/auth_provider.dart';
import 'package:assignment_customer_app/core/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FloatingNavBar extends StatelessWidget {
  const FloatingNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final backgroundColor = themeProvider.backgroundColor;
    final textColor = themeProvider.textColor;
    final accentColor = themeProvider.accentColor;
    final authProvider = context.watch<AuthProvider>();
    
    final loggedIn = authProvider.isLoggedIn;
    return Positioned(
      bottom: 24,
      left: 0,
      right: 0,
      child: Center(
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(999),
          color: backgroundColor,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: accentColor, width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => context.go('/'),
                  icon: Icon(Icons.home, size: 22, color: textColor),
                ),
                IconButton(
                  onPressed: () => context.go('/order'),
                  icon: Icon(Icons.add_circle_outline,
                      size: 22, color: textColor),
                ),
                IconButton(
                  onPressed: loggedIn ? () => context.go('/profile') : null,
                  icon: Icon(Icons.person_outline, size: 22, color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
