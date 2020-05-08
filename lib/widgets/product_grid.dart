import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/providers/product_provider.dart';
import 'package:providerdemo/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool favoriteProduct;

  ProductGrid(this.favoriteProduct);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final productList = favoriteProduct
        ? productData.showFavoriteProductList
        : productData.items;

    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: productList.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: productList[index],
        child: ProductItem(
//          id: productList[index].id,
//          title: productList[index].title,
//          description: productList[index].description,
//          imageUrl: productList[index].imageUrl,
//          price: productList[index].price,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2),
    );
  }
}
