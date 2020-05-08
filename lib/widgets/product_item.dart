import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/providers/cart.dart';
import 'package:providerdemo/providers/product_model.dart';
import 'package:providerdemo/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
//  final String id;
//  final String title;
//  final String description;
//  final String imageUrl;
//  final double price;
//
//  ProductItem(
//      {this.id, this.title, this.description, this.imageUrl, this.price});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routName, arguments: product.id);
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.fill,
          ),
          header: IconButton(
            alignment: Alignment.topRight,
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              cart.addCartItem(product.id, product.price, product.title);
            },
            color: Theme.of(context).accentColor,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
              builder: (context, product, child) => IconButton(
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  product.isFavoriteProduct();
                },
                color: Theme.of(context).accentColor,
              ),
            ),
            title: Text(
              product.title,
              style: GoogleFonts.lato(),
              textAlign: TextAlign.center,
            ),
            trailing: Text(
              '\u20B9 ${product.price}',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 12.0),
            ),
          ),
        ),
      ),
    );
  }
}
