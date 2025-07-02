import 'package:flutter/material.dart';
import '../widgets/global_form_button.dart';
import '../models/product_model.dart';
import '../services/products.service.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Puedes cambiar el token si lo necesitas en el futuro
    const token = '';

    // ValueNotifier para manejar la selección de productos
    final ValueNotifier<Set<int>> seleccionados = ValueNotifier<Set<int>>({});

    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: FutureBuilder<List<Product>>(
        future: fetchProducts(token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final productos = snapshot.data ?? [];
          if (productos.isEmpty) {
            return const Center(child: Text('No hay productos disponibles'));
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: ValueListenableBuilder<Set<int>>(
                    valueListenable: seleccionados,
                    builder: (context, value, _) {
                      return ListView(
                        children: [
                          ...productos.asMap().entries.map((entry) {
                            final idx = entry.key;
                            final producto = entry.value;
                            return CheckboxListTile(
                              value: value.contains(idx),
                              onChanged: (checked) {
                                final nuevo = Set<int>.from(value);
                                if (checked == true) {
                                  nuevo.add(idx);
                                } else {
                                  nuevo.remove(idx);
                                }
                                seleccionados.value = nuevo;
                              },
                              title: Text('${producto.nombre} (\$${producto.precioUnitario.toStringAsFixed(2)})'),
                              subtitle: Text(producto.descripcion),
                            );
                          }),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<Set<int>>(
                  valueListenable: seleccionados,
                  builder: (context, value, _) {
                    return GlobalFormButton(
                      label: 'Ir al carrito',
                      onTap: () {
                        final seleccion = value.map((i) => productos[i]).toList();
                        Navigator.pushNamed(
                          context,
                          '/cart',
                          arguments: seleccion,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}