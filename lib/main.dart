import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/providers/cart.dart';
import 'package:providerdemo/providers/product_provider.dart';
import 'package:providerdemo/screens/product_overview_screen.dart';
import 'screens/product_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        home: ProductOverViewScreen(),
        routes: {
          ProductDetailScreen.routName: (context) => ProductDetailScreen()
        },
      ),
    );
  }
}
