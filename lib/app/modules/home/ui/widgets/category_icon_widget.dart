import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final String _title;
  final bool _isSelected;
  final Function _onTap;

  CategoryIcon({
    @required String title,
    @required Function onTap,
    bool isSelected = false,
  })  : this._title = title,
        this._onTap = onTap,
        this._isSelected = isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this._onTap,
      child: Container(
        height: 45,
        width: 110,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        decoration: BoxDecoration(
          color: this._isSelected ? Color(0xFF5FC15E) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          this._title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: this._isSelected ? Colors.white : Colors.black,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
