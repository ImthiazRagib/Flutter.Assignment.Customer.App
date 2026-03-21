import 'package:flutter/material.dart';

class CustomSnackbar {
  const CustomSnackbar._();

  static SnackBar snackbar(
    BuildContext context, {
    required Widget content,
    required String state,
  }) {
    final mq = MediaQuery.of(context);
    // Keep SnackBar above shell FloatingNavBar (see widgets/floating_nav_bar.dart):
    // Positioned(bottom: 24) + padded row (~64) + gap above bar.
    const floatingNavBarBottomOffset = 20.0;
    const floatingNavBarContentHeight = 20.0;
    const gapAboveFloatingNav = 2.0;
    final bottomMargin =
        mq.padding.bottom +
        floatingNavBarBottomOffset +
        floatingNavBarContentHeight +
        gapAboveFloatingNav;

    Color getStateColor({required String state}) {
      switch (state) {
        case 'success':
          return Colors.green;
        case 'error':
          return Colors.red;
        default:
          return Colors.blue;
      }
    }

    return SnackBar(
      content: content,
      backgroundColor: getStateColor(state: state,),
      duration: Duration(seconds: 2),
      padding: EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(left: 16, right: 16, bottom: bottomMargin),
    );
  }
}
