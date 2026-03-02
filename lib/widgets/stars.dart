import 'package:assignment_customer_app/core/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Stars extends StatelessWidget {
  const Stars({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final primaryColor = themeProvider.primaryColor;
    
    final full = rating.floor().clamp(0, 5);
    final hasHalf = (rating - full) >= 0.5 && full < 5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        if (i < full) {
          return Icon(Icons.star, size: 16, color: primaryColor);
        }
        if (i == full && hasHalf) {
          return Icon(Icons.star_half, size: 16, color: primaryColor);
        }
        return Icon(Icons.star_border, size: 16, color: primaryColor);
      }),
    );
  }
}