import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StandardTextField extends StatelessWidget {
  final String _placeholder;

  StandardTextField({String placeholder}) : _placeholder = placeholder;

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 20;

    return Container(
      alignment: Alignment.center,
      height: 50,
      width: MediaQuery.of(context).size.width * .65,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xFFE5E5E5),
              blurRadius: 5.1,
              spreadRadius: .6,
              offset: Offset(0, 0),
            )
          ]),
      child: CupertinoTextField(
        cursorColor: Color(0xFF5FC15E),
        prefix: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.search,
              color: Color(0xFF5FC15E),
              size: 28,
            ),
          ],
        ),
        suffix: SizedBox(
          width: 15,
        ),
        style: TextStyle(fontSize: 15),
        placeholder: this._placeholder,
        placeholderStyle: TextStyle(
            color: Color(0xFFADB0B1), fontSize: 15, letterSpacing: 1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
