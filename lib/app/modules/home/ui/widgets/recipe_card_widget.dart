import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String _recipeName;
  final String _recipeImagePath;
  final double _recipeRating;
  final int _recipeCalories;
  final bool _isFavorite;
  final bool _isBookmark;

  RecipeCard({
    @required String recipeName,
    @required String recipeImagePath,
    @required double recipeRating,
    @required int recipeCalories,
    @required bool isFavorite,
    @required bool isBookmark,
  })  : _recipeName = recipeName,
        _recipeImagePath = recipeImagePath,
        _recipeRating = recipeRating,
        _recipeCalories = recipeCalories,
        _isFavorite = isFavorite,
        _isBookmark = isBookmark;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      width: 175,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _image(),
          SizedBox(height: 5),
          _rating(),
          SizedBox(height: 15),
          Expanded(
            child: _title(),
          ),
          SizedBox(height: 15),
          _footer(),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
      height: 125,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.network(
            this._recipeImagePath,
          ).image,
        ),
      ),
    );
  }

  Widget _rating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Color(0xFFF76D47),
              size: 20,
            ),
            SizedBox(width: 5),
            Text(
              this._recipeRating.toStringAsFixed(1).toString(),
              style: TextStyle(
                letterSpacing: 1.5,
              ),
            )
          ],
        ),
        Icon(
          this._isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Color(0xFFF76D47),
        )
      ],
    );
  }

  Widget _title() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        this._recipeName,
        style: TextStyle(
          letterSpacing: 1.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${this._recipeCalories} cal',
          style: TextStyle(
            letterSpacing: 1.5,
          ),
        ),
        Icon(
          this._isBookmark ? Icons.bookmark : Icons.bookmark_border,
          color: Color(0xFFF76D47),
        )
      ],
    );
  }
}
