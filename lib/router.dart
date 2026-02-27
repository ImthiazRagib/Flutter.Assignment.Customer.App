import 'package:flutter/material.dart';
import 'package:assignment_customer_app/features/auth/login.dart';
import 'package:assignment_customer_app/features/auth/signup.dart';
import 'package:assignment_customer_app/features/dashboard.dart';
import 'package:assignment_customer_app/features/order_page.dart';
import 'package:assignment_customer_app/features/profile.dart';
import 'package:assignment_customer_app/widgets/floating_nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'features/landing/landing.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => Stack(
        children: [
          child,
          const FloatingNavBar(),
        ],
      ),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const LandingPage(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => const SignUpPage(),
        ),
        GoRoute(
          path: '/order',
          builder: (context, state) => const OrderPage(),
        ),
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardPage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),
  ],
);
