
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

Future<List<Product>> fetchProducts(String token) async {
  final baseUrl = dotenv.env['API_URL']!;
  final url = Uri.parse('$baseUrl/products');
  final respuesta = await http.get(
    url,
    headers: {'Authorization': 'Bearer $token'},
  );

  if (respuesta.statusCode == 200) {
    final List lista = jsonDecode(respuesta.body);
    return lista.map((j) => Product.fromJson(j)).toList(); 
  } else {
    throw Exception('No se pueden cargar los productos!');
  }
}
