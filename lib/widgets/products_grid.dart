import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quiz_application/widgets/product_item.dart';

import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool isFavs;
  const ProductsGrid({
    super.key,
    required this.isFavs,
  });

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = isFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: products[index],
        // create: (context) => products[index],
        child: const ProductItem(
            // imageUrl: products[index].imageUrl,
            // id: products[index].id,
            // title: products[index].title,
            ),
      ),
    );
  }
}
