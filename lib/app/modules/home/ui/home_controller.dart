import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ui_challenge_allveg/app/modules/home/models/category_model.dart';
import 'package:ui_challenge_allveg/app/modules/home/models/ingredients_model.dart';
import 'package:ui_challenge_allveg/app/modules/home/models/recipe_model.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  //State management
  @observable
  int _currentCategoryIndex = 0;

  @observable
  int _currentIngredientIndex = 0;

  @computed
  int get currentCategoryIndex => _currentCategoryIndex;

  @computed
  int get currentIngredientIndex => _currentIngredientIndex;

  @action
  void setCurrentCategoryIndex(int value) {
    _currentCategoryIndex = value;
  }

  @action
  void setCurrentIngredientIndex(int value) {
    _currentIngredientIndex = value;
  }

  //List of Models
  List<IngredientModel> ingredientsList;
  List<RecipeModel> recipesList;
  List<CategoryModel> categoriesList;

  //Methods
  void loadAppInfo({
    @required List<Map<String, dynamic>> ingredients,
    @required List<Map<String, dynamic>> recipes,
    @required List<Map<String, dynamic>> categories,
  }) {
    ingredientsList = _getIngredients(ingredients);
    recipesList = _getRecipes(recipes);
    categoriesList = _getCategories(categories);
  }

  List<IngredientModel> _getIngredients(List<Map<String, dynamic>> listOfJson) {
    return listOfJson.map((json) => IngredientModel.fromJson(json)).toList();
  }

  List<RecipeModel> _getRecipes(List<Map<String, dynamic>> listOfJson) {
    return listOfJson.map((json) => RecipeModel.fromJson(json)).toList();
  }

  List<CategoryModel> _getCategories(List<Map<String, dynamic>> listOfJson) {
    return listOfJson.map((json) => CategoryModel.fromJson(json)).toList();
  }
}
