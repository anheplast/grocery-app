
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<String> loginService(String username, String password) async {
  final baseUrl = dotenv.env['API_URL']!;
  final url = Uri.parse('$baseUrl/auth/login');

  print('$username');
  print('$password');
  final respuesta = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'usuario': username, 'password': password})
  );

  if (respuesta.statusCode == 200) {
    final data = jsonDecode(respuesta.body);
    print('Inicio de sesión exitoso!');
    return data['token'];
  } else {
    throw Exception('Error: ${respuesta.statusCode}');
  }
}