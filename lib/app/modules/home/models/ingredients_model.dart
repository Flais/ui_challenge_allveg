import 'package:flutter/material.dart';

class IngredientModel {
  final String _name;
  final String _imagePath;
  bool _isSelected;

  IngredientModel(
      {@required String name,
      @required String imagePath,
      @required bool isSelected})
      : this._name = name,
        this._imagePath = imagePath,
        this._isSelected = isSelected;

  String get name => this._name;

  String get imagePath => this._imagePath;

  bool get isSelected => this._isSelected;

  void setIsSelected(bool value) {
    this._isSelected = value;
  }
}
