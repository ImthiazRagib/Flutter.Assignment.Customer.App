import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../core/auth_provider.dart';
import '../../core/theme_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final primaryColor = themeProvider.primaryColor;
    final textColor = themeProvider.textColor;
    final accentColor = themeProvider.accentColor;
    final secondaryColor = themeProvider.secondaryColor;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.canPop() ? context.pop() : context.go('/'),
        ),
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () => themeProvider.isDarkMode
                ? themeProvider.setThemeMode(ThemeMode.light)
                : themeProvider.setThemeMode(ThemeMode.dark),
            icon: themeProvider.isDarkMode
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                // color: ,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: Text(
                                  'IR',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: accentColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Imthiaz Ragib",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  ),
                                  Text(
                                    "UserId: 100012",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: textColor,
                                    ),
                                  ),
                                  Text(
                                    "Rating: 4.5",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () => {},
                              icon: Icon(
                                Icons.edit,
                                size: 16,
                                color: accentColor,
                                semanticLabel: 'Edit',
                              ),
                              tooltip: 'Edit',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
