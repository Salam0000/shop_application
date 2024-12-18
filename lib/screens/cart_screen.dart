import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_application/providers/cart.dart' show Cart;
import 'package:quiz_application/providers/orders.dart';

import '../widgets/cart_item.dart' as ct;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Your Cart'),
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total', style: TextStyle(fontSize: 20)),
                // const SizedBox(width: 10),
                const Spacer(),
                Chip(
                  label: Text(
                    '\$${cart.totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      // color: Theme.of(context).primaryTextTheme.titleLarge!.color,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<Orders>(
                      context,
                      listen: false,
                    ).addOrder(
                      cart.items.values.toList(),
                      cart.totalAmount,
                    );
                    cart.clearCart();
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple),
                  ),
                  child: const Text('Order Now'),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) => ct.CartItem(
                    productId: cart.items.keys.toList()[index],
                    id: cart.items.values.toList()[index].id,
                    title: cart.items.values.toList()[index].title,
                    quantity: cart.items.values.toList()[index].quantity,
                    price: cart.items.values.toList()[index].price,
                  ),
              itemCount: cart.items.length),
        ),
      ]),
    );
  }
}
