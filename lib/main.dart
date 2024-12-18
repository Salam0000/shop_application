import 'package:flutter/material.dart';
import 'package:quiz_application/providers/cart.dart';
import 'package:quiz_application/providers/orders.dart';
import 'package:quiz_application/providers/products.dart';
import 'package:quiz_application/screens/cart_screen.dart';
import 'package:quiz_application/screens/orders_screen.dart';
import 'package:quiz_application/screens/product_detail_screen.dart';
import 'package:quiz_application/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // value: Products(),
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Application',
        theme: ThemeData().copyWith(
          primaryColor: Colors.purple,
          colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.deepOrange),
          // fontFamily: 'Lato',
          // accentColor: Colors.deepOrange,
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) =>
              const ProductDetailScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
          OrdersScreen.routeName: (context) => const OrdersScreen(),
        },
      ),
    );
  }
}
