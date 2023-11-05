import 'package:flutter/material.dart';

class CardApp extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double? height;

  const CardApp({
    super.key,
    this.child,
    this.color,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(1, 4), // Shadow position
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 10,
      ),
      child: child,
    );
  }
}
