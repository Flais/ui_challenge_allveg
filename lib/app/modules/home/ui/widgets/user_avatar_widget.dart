import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double _size;
  final double _borderRadius;
  final String _pictureUrl;

  UserAvatar({
    @required String pictureUrl,
    double size = 100,
    double borderRadius = 999,
  })  : this._pictureUrl = pictureUrl,
        this._borderRadius = borderRadius,
        this._size = size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this._size,
      width: this._size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(this._borderRadius),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.network(this._pictureUrl).image,
        ),
      ),
    );
  }
}
