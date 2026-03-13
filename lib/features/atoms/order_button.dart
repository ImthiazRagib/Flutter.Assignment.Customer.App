import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({super.key, required this.label, this.width, this.onPressed});
  final String label;
  final double? width;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width * 2 / 3,
        child: ElevatedButton(
          onPressed: onPressed ?? () => context.go('/order'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFBD502),
            foregroundColor: Color(0xFF13245A),
            padding: EdgeInsets.symmetric(vertical: 14),
          ),
          child: Text(label),
        ),
      ),
    );
  }
}
