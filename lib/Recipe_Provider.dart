import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Recipe_model.dart';

class RecipeProvider with ChangeNotifier {
  List<Recipe> _recipes = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Recipe> get recipes => _recipes;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchRecipes() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final recipeList = RecipeList.fromJson(jsonData);
        _recipes = recipeList.recipes;  // Extract the list of recipes
      } else {
        _errorMessage = 'Failed to load recipes';
      }
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
