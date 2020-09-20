import 'package:flutter/widgets.dart';

class RecipeModel {
  final String _name;
  final String _imagePath;
  final int _calories;
  double _rating;
  bool _isBookmark;
  bool _isFavorite;

  RecipeModel({
    @required String name,
    @required String imagePath,
    @required int calories,
    @required double rating,
    @required bool isBookmark,
    @required bool isFavorite,
  })  : this._name = name,
        this._imagePath = imagePath,
        this._calories = calories,
        this._rating = rating,
        this._isBookmark = isBookmark,
        this._isFavorite = isFavorite;

  String get name => this._name;

  String get imagePath => this._imagePath;

  int get calories => this._calories;

  double get rating => this._rating;

  bool get isBookmark => this._isBookmark;

  bool get isFavorite => this._isFavorite;

  toggleIsFavorite() {
    this._isFavorite = !this._isFavorite;
  }

  toggleIsBookmark() {
    this._isBookmark = !this._isBookmark;
  }

  setRating(double value) {
    this._rating = value;
  }

  @override
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      name: json['name'],
      imagePath: json['imagePath'],
      rating: json['rating'],
      calories: json['calories'],
      isBookmark: json['isBookmark'],
      isFavorite: json['isFavorite'],
    );
  }
}
