
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './screen/login_screen.dart';
import './screen/home_screen.dart';
import './screen/products_screen.dart';
import './screen/cart_screen.dart';
import './screen/confirmation_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/products': (context) => const ProductsScreen(),
        '/cart': (context) => const CartScreen(),
        '/confirmation': (context) => ConfirmationScreen(),
      },
    );
  }
}
