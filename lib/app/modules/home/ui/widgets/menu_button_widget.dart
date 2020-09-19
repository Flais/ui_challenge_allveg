import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 70,
      decoration: BoxDecoration(
        color: Color(0xFF5FC15E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _divider(paddingLeft: 34, paddingRight: 20),
          SizedBox(height: 7),
          _divider(paddingLeft: 20, paddingRight: 20),
        ],
      ),
    );
  }

  Widget _divider({
    @required double paddingLeft,
    @required double paddingRight,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: paddingLeft,
        right: paddingRight,
      ),
      child: Container(
        height: 2,
        color: Colors.white,
      ),
    );
  }
}
