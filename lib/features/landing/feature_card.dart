import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment_customer_app/core/theme_provider.dart';

class FeatureCard extends StatelessWidget {
  FeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });
  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final backgroundColor = themeProvider.backgroundColor;
    final textColor = themeProvider.textColor;
    final primaryColor = themeProvider.primaryColor;
    final secondaryColor = themeProvider.secondaryColor;
    final cardColor = themeProvider.isDarkMode ? secondaryColor : backgroundColor;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(blurRadius: 4, color: Colors.black.withValues(alpha: 0.8)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 28, color: secondaryColor),
          ),
          SizedBox(height: 6),
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
          SizedBox(height: 6),
          Flexible(
            child: Text(
              description,
              style: TextStyle(fontSize: 14, color: textColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
