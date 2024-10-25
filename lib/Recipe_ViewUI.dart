import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_proj1/Recipe_Provider.dart';

class RecipeView extends StatefulWidget {
  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
      recipeProvider.fetchRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Recipe Ratings', style: TextStyle(color: Colors.white),),
      ),
      body: recipeProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : recipeProvider.errorMessage != null
          ? Center(child: Text('Error: ${recipeProvider.errorMessage}'))
          : ListView.builder(
        itemCount: recipeProvider.recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipeProvider.recipes[index];
          return ListTile(
            leading: Image.network(recipe.image, width: 50, height: 50),
            title: Text(recipe.name),
            onTap: () {
              // Handle recipe click
            },
          );
        },
      ),
    );
  }
}
