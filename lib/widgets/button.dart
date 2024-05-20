import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ButtonWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        elevation: 1
      ),
      child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
    );
  }
}