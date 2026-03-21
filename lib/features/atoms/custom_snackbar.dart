import 'package:assignment_customer_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  const CustomSnackbar._();

  static SnackBar snackbar(
    BuildContext context, {
    required Widget content,
    required String state,
  }) {
    final mq = MediaQuery.of(context);
    // Match scroll content clearance (see [kFloatingNavBarReserve] in constants.dart)
    // + system bottom inset so SnackBar clears the shell FloatingNavBar overlay.
    final bottomMargin = mq.padding.bottom + kFloatingNavBarReserve;

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
