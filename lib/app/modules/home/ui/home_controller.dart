import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ui_challenge_allveg/app/modules/home/models/ingredients_model.dart';
import 'package:ui_challenge_allveg/app/modules/home/models/recipe_model.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  List<IngredientModel> ingredientsList;
  List<RecipeModel> recipesList;

  void loadAppInfo({
    @required List<Map<String, dynamic>> ingredients,
    @required List<Map<String, dynamic>> recipes,
  }) {
    ingredientsList = _getIngredients(ingredients: ingredients);
    recipesList = _getRecipes(recipes: recipes);
  }

  List<IngredientModel> _getIngredients(
      {@required List<Map<String, dynamic>> ingredients}) {
    return ingredients
        .map(
          (ingredient) => IngredientModel(
            name: ingredient['name'],
            imagePath: ingredient['imagePath'],
            isSelected: ingredient['isSelected'],
          ),
        )
        .toList();
  }

  List<RecipeModel> _getRecipes(
      {@required List<Map<String, dynamic>> recipes}) {
    return recipes
        .map(
          (recipe) => RecipeModel(
            name: recipe['name'],
            imagePath: recipe['imagePath'],
            rating: recipe['rating'],
            calories: recipe['calories'],
            isBookmark: recipe['isBookmark'],
            isFavorite: recipe['isFavorite'],
          ),
        )
        .toList();
  }
}
