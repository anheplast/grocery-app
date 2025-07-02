import 'package:flutter/material.dart';
import '../widgets/global_form_button.dart';
import '../models/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final seleccionados = ModalRoute.of(context)?.settings.arguments as List<Product>? ?? [];

    final total = seleccionados.fold<double>(0, (sum, p) => sum + p.precioUnitario);

    return Scaffold(
      appBar: AppBar(title: const Text('Carrito')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: seleccionados.isEmpty
                  ? const Center(child: Text('No hay productos seleccionados'))
                  : ListView(
                      children: seleccionados
                          .map((p) => ListTile(
                                title: Text(p.nombre),
                                subtitle: Text(p.descripcion),
                                trailing: Text('\$${p.precioUnitario.toStringAsFixed(2)}'),
                              ))
                          .toList(),
                    ),
            ),
            const SizedBox(height: 20),
            Text(
              'Total \$${total.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            GlobalFormButton(
              label: 'Realizar compra',
              onTap: () {
                Navigator.pushNamed(context, '/confirmation');
              },
            ),
          ],
        ),
      ),
    );
  }
}