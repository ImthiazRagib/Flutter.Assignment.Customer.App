import 'package:assignment_customer_app/core/theme_provider.dart';
import 'package:assignment_customer_app/features/atoms/heading_capsule.dart';
import 'package:assignment_customer_app/features/atoms/order_button.dart';
import 'package:assignment_customer_app/features/atoms/primary_banner_bar.dart';
import 'package:assignment_customer_app/widgets/testimonials/testimonial_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'assignment_help.dart';
import 'package:go_router/go_router.dart';
import 'package:assignment_customer_app/core/auth_provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final themeProvider = Provider.of<ThemeProvider>(context);
    final backgroundColor = themeProvider.backgroundColor;
    final textColor = themeProvider.textColor;
    final accentColor = themeProvider.accentColor;
    final authenticated = authProvider.isLoggedIn;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment Solutions"),
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        iconTheme: IconThemeData(color: textColor),
        leading: Builder(
          builder: (ctx) => IconButton(
            onPressed: () => Scaffold.of(ctx).openDrawer(),
            icon: const Icon(Icons.menu),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => themeProvider.isDarkMode
                ? themeProvider.setThemeMode(ThemeMode.light)
                : themeProvider.setThemeMode(ThemeMode.dark),
            icon: themeProvider.isDarkMode
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
          authenticated
              ? IconButton(
                  onPressed: () => context.go('/notification'),
                  icon: const Icon(Icons.notifications),
                )
              : IconButton(
                  onPressed: () => context.go('/login'),
                  icon: const Icon(Icons.login),
                ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF13245A)),
              child: Text(
                "Assignment Solutions",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
                context.go('/');
              },
            ),
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text("Order"),
              onTap: () {
                Navigator.pop(context);
                context.go('/order');
              },
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Dashboard"),
              onTap: () {
                Navigator.pop(context);
                context.go('/dashboard');
              },
            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text("Profile"),
              onTap: () {
                Navigator.pop(context);
                context.go('/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text("Login"),
              onTap: () {
                Navigator.pop(context);
                context.go('/login');
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text("Sign up"),
              onTap: () {
                Navigator.pop(context);
                context.go('/signup');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () async {
                Navigator.pop(context);
                await authProvider.logout();
                context.go('/');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              color: const Color(0xFF13245A),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                  children: [
                    const TextSpan(
                      text:
                          "Get \$20 Bonus And Earn 10% Commission On All Your Friend's Order For Life! ",
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: SizedBox(width: 5),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: SizedBox(
                        height: 28,
                        child: OutlinedButton(
                          onPressed: () => (() {}),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            foregroundColor: Color(0xFFFBD502),
                            side: const BorderSide(color: Color(0xFFFBD502)),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text("Start Earning"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Assignment Writing Services Offered By Us",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Expert help for all your academic assignments — fast, reliable, and affordable.",
                    style: TextStyle(fontSize: 14, color: accentColor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  OrderButton(
                    label: "Get assignment help now",
                    width: double.infinity,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 48,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  HeadingCapsule(label: "Assignments", icon: Icons.assignment),
                  HeadingCapsule(label: "Expert Help", icon: Icons.school),
                  HeadingCapsule(label: "On Time", icon: Icons.schedule),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                children: [
                  Text(
                    "Seek Assignment Help from Us and Reduce All Your Stress!",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Assignment writing is essential for your grades but can be challenging. Students often struggle with topics, research, and drafting. Our experts help you overcome these hurdles and deliver strong assignments.",
                    style: TextStyle(fontSize: 14, color: accentColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            AssignmentHelp(),
            SizedBox(height: 10),
            TestimonialSlider(),
            SizedBox(height: 10),
            PrimaryBannerBar(
              text: "Become a Partner",
              ctaText: "Join Now",
              onTap: () => (() {}),
            ),
          ],
        ), // parent
      ),
    );
  }
}
