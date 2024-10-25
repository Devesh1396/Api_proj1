import 'package:api_proj1/Recipe_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ProductViewUI.dart';
import 'Recipe_ViewUI.dart';
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
        ChangeNotifierProvider(
          create: (_) => RecipeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Api Data App',
        debugShowCheckedModeBanner: false,
        home: RecipeView(),
      ),
    );
  }
}
