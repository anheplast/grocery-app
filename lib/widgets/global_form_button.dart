import 'package:flutter/material.dart';

class GlobalFormButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const GlobalFormButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: const Color.fromARGB(255, 96, 170, 96),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(label, style: const TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}
