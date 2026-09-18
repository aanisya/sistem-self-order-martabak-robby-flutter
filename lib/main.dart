import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/menu_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/order_screen.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Martabak Robby',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MenuScreen(),
          '/cart': (context) => CartScreen(),
          '/order': (context) => OrderScreen(),
        },
      ),
    );
  }
}
