import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ProductViewUI.dart';
import 'product_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Product App',
        debugShowCheckedModeBanner: false,
        home: ProductView(),
      ),
    );
  }
}
