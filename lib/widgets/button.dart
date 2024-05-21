import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;
  const ButtonWidget(
      {super.key,
      required this.title,
      required this.onTap,
      this.color,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.black, elevation: 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
