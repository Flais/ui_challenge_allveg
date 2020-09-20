import 'package:flutter/widgets.dart';

class CategoryModel {
  final String _name;
  bool _isSelected;

  CategoryModel({@required String name, bool isSelected = false})
      : this._name = name,
        this._isSelected = isSelected;

  String get name => this._name;

  bool get isSelected => this._isSelected;

  void setIsSelected(bool value) {
    this._isSelected = value;
  }

  @override
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
    );
  }
}
