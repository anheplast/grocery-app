

import 'package:flutter/material.dart';
import '../widgets/global_form_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bienvenido!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            GlobalFormButton(
              label: 'Ir a productos',
              onTap: () {
                Navigator.pushNamed(context, '/products');
              },
            ),
          ],
        ),
      ),
    );
    
  }
}

