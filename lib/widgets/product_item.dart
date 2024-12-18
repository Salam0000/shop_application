import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_application/providers/cart.dart';
import 'package:quiz_application/providers/product.dart';
import 'package:quiz_application/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem({
  //   required this.id,
  //   required this.title,
  //   required this.imageUrl,
  // });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
      listen: false,
    );
    final cart = Provider.of<Cart>(
      context,
      listen: false,
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
              icon: Icon(
                product.isFavorite! ? Icons.favorite : Icons.favorite_border,
              ),
              color: Colors.deepOrange,
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            // color: Colors.deepOrange,
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
              // Scaffold.of(context).show
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(
                    'Added item to cart!',
                    // textAlign: TextAlign.center,
                  ),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                    // textColor: Colors.deepOrange,
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    },
                  ),
                ),
              );
            },
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
