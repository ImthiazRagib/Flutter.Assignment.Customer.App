import 'package:assignment_customer_app/core/theme_provider.dart';
import 'package:assignment_customer_app/core/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final backgroundColor = themeProvider.backgroundColor;
    final textColor = themeProvider.textColor;
    final accentColor = themeProvider.accentColor;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    
    Future<void> login({
      required String emailOrPhone,
      required String password,
    }) async {
      await authProvider.setEmailOrPhone(emailOrPhone);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You are logged in successfully')),
      );
      context.go('/dashboard');
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.canPop() ? context.pop() : context.go('/'),
        ),
        title: const Text("Login"),
        actions: [
          IconButton(
            onPressed: () => themeProvider.isDarkMode ?
            themeProvider.setThemeMode(ThemeMode.light) :
            themeProvider.setThemeMode(ThemeMode.dark),
            icon: themeProvider.isDarkMode ?
            const Icon(Icons.light_mode) :
            const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back👏🏻",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            Text(
              "Login to your account to continue",
              style: TextStyle(fontSize: 16, color: textColor),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: LoginForm(
                  submitLabel: 'Login',
                  onSubmit: (emailOrPhone, password) =>
                      login(emailOrPhone: emailOrPhone, password: password),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
