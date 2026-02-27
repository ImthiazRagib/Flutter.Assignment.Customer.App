import 'package:assignment_customer_app/core/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssignmentHelp extends StatelessWidget {
  const AssignmentHelp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final accentColor = themeProvider.accentColor;

    return Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 8,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Need Assignment Help? Our Professionals Offer Assistance in All Types of Assignments",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: accentColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Have a look at the few assignment types that our writers work on",
                        style: TextStyle(fontSize: 14, color: accentColor),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
  }
}