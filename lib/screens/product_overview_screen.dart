import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/providers/cart.dart';
import 'package:providerdemo/providers/product_provider.dart';
import 'package:providerdemo/widgets/badge.dart';
import 'package:providerdemo/widgets/product_grid.dart';

enum FilterOptions { Favorite, All }

class ProductOverViewScreen extends StatefulWidget {
  @override
  _ProductOverViewScreenState createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  var _showFavoriteProduct = false;

  @override
  Widget build(BuildContext context) {
//    final product = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Application',
          style: GoogleFonts.lato(),
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedOption) {
              setState(() {
                if (selectedOption == FilterOptions.Favorite) {
                  //Show favorite product
//                product.showFavoriteOnly();
                  _showFavoriteProduct = true;
                } else {
                  //Show all product
//                product.showAll();
                  _showFavoriteProduct = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorite'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: ProductGrid(_showFavoriteProduct),
    );
  }
}
