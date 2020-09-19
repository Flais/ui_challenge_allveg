import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ui_challenge_allveg/app/fixtures/fixtures.dart';
import 'package:ui_challenge_allveg/app/modules/home/ui/widgets/category_icon_widget.dart';
import 'package:ui_challenge_allveg/app/modules/home/ui/widgets/ingredient_widget.dart';
import 'package:ui_challenge_allveg/app/modules/home/ui/widgets/menu_button_widget.dart';
import 'package:ui_challenge_allveg/app/modules/home/ui/widgets/recipe_card_widget.dart';
import 'package:ui_challenge_allveg/app/modules/home/ui/widgets/textfield_widget.dart';
import 'package:ui_challenge_allveg/app/modules/home/ui/widgets/user_avatar_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.loadAppInfo(
      ingredients: ingredientsFixture,
      recipes: recipesFixture,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              height: 150,
              color: Colors.white,
              child: SafeArea(
                child: header(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFE7F0E8),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              child: SafeArea(
                child: productsBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            UserAvatar(
              pictureUrl:
                  'https://f.i.uol.com.br/fotografia/2019/07/13/15630387845d2a1440096be_1563038784_3x2_lg.jpg',
              size: 70,
            ),
            SizedBox(width: 10),
            Row(
              children: [
                Text(
                  'Hi, ',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'João',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        MenuButton()
      ],
    );
  }

  Widget productsBody() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchTextField(),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: categories(),
          ),
          SizedBox(height: 25),
          ingredientsListView(),
          SizedBox(height: 50),
          popularRecipes(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget searchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: StandardTextField(
        placeholder: 'Search a recipe',
      ),
    );
  }

  Widget categories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryIcon(
          title: 'Vegetables',
          isSelected: true,
        ),
        CategoryIcon(
          title: 'Fruits',
        ),
        CategoryIcon(
          title: 'Beans',
        ),
      ],
    );
  }

  ingredientsListView() {
    return Container(
      alignment: Alignment.center,
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.ingredientsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Ingredient(
            title: controller.ingredientsList[index].name,
            imagePath: controller.ingredientsList[index].imagePath,
            isSelected: controller.ingredientsList[index].isSelected,
            onTap: () {

            },
          );
        },
      ),
    );
  }

  Widget popularRecipes() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Recipes',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5),
                ),
                Text(
                  'View All',
                  style: TextStyle(fontSize: 14, letterSpacing: 1.5),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.recipesList.length,
              itemBuilder: (BuildContext context, int index) {
                return RecipeCard(
                  recipeName: controller.recipesList[index].name,
                  recipeImagePath: controller.recipesList[index].imagePath,
                  recipeRating: controller.recipesList[index].rating,
                  recipeCalories: controller.recipesList[index].calories,
                  isBookmark: controller.recipesList[index].isBookmark,
                  isFavorite: controller.recipesList[index].isFavorite,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
