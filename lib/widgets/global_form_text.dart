

import 'package:flutter/material.dart';

class GlobalFormText extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController? controller;

  const GlobalFormText({
    super.key,
    required this.label,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
    
  }
}