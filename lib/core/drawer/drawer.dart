import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:assignment_customer_app/core/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:assignment_customer_app/core/drawer/drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final loggedInItems = <DrawerItem>[
    DrawerItem(icon: Icons.home, title: "Home", route: '/'),
    DrawerItem(icon: Icons.add_circle_outline, title: "Order", route: '/order'),
    DrawerItem(icon: Icons.dashboard, title: "Dashboard", route: '/dashboard'),
    DrawerItem(icon: Icons.person_outline, title: "Profile", route: '/profile'),
    // logout handled specially:
    DrawerItem(
      icon: Icons.logout,
      title: "Logout",
      route: '/',
      isLoggOutAction: true,
    ),
  ];

  final loggedOutItems = <DrawerItem>[
    DrawerItem(icon: Icons.home, title: "Home", route: '/'),
    DrawerItem(icon: Icons.add_circle_outline, title: "Order", route: '/order'),
    DrawerItem(icon: Icons.login, title: "Login", route: '/login'),
    DrawerItem(icon: Icons.person_add, title: "Sign up", route: '/signup'),
  ];

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final loggedItems = authProvider.isLoggedIn ? loggedInItems : loggedOutItems;
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 16),
            children: loggedItems.map((item) => ListTile(
              leading: Icon(item.icon),
              title: Text(item.title),
              onTap: () async {
                Navigator.pop(context);
                context.go(item.route);
                if (item.isLoggOutAction != null && item.isLoggOutAction!) {
                  await authProvider.logout();
                  if (!context.mounted) return;
                  context.go('/');
                }
            },
          )).toList(),
        ),
      ),
    );
  }
}
