import 'package:flutter/material.dart';

class Ingredient extends StatelessWidget {
  final String _title;
  final String _imagePath;
  final bool _isSelected;
  final Function _onTap;

  Ingredient({
    @required String title,
    @required String imagePath,
    @required Function onTap,
    bool isSelected = false,
  })  : _title = title,
        _onTap = onTap,
        _imagePath = imagePath,
        _isSelected = isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this._onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: 210,
        width: 110,
        decoration: BoxDecoration(
          color: this._isSelected ? Color(0xFFF76D47) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Image.asset(
              this._imagePath,
              height: 125,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              this._title,
              style: TextStyle(
                fontSize: 14,
                color: this._isSelected ? Colors.white : Colors.black,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
