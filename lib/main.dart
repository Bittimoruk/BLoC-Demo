import 'package:flutter/material.dart';

import 'screens/cart_screen.dart';
import 'screens/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/" : (BuildContext context) => const ProductListScreen(),
        "/cart" : (BuildContext context) => const CartScreen()
      },
      initialRoute: "/",
    );
  }
}