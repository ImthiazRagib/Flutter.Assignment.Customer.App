import 'package:assignment_customer_app/core/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../core/auth_provider.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticated = Provider.of<AuthProvider>(context, listen: false);
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final backgroundColor = themeProvider.backgroundColor;
    final textColor = themeProvider.textColor;
    final accentColor = themeProvider.accentColor;

    Future<void> login(String emailOrPhone, String password) async {
      authenticated.login();
      // context.go('/dashboard');
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.canPop() ? context.pop() : context.go('/'),
        ),
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Welcome Back👏🏻",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor),
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
                child: LoginForm(submitLabel: 'Login', onSubmit: login),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
