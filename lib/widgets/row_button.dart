import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonsContainer extends StatelessWidget {

  final String textValue;
  final Function calculation;

  ButtonsContainer({this.textValue, this.calculation});

  @override
  Widget build(BuildContext context) {
    bool isNumeric(String value) {
      if (value == null) {
        return false;
      }
      return double.tryParse(value) != null;
    }

    if (textValue == '=') {
      return Container(
        height: 150.0,
        width: 70.0,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Color(0xFFFD8D8C),
          borderRadius: BorderRadius.circular(35.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: SizedBox(
          height: 150.0,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.0),
            ),
            onPressed: () {
              calculation(textValue);
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '$textValue',
                style: TextStyle(
                    fontSize: 45.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ),
      );
    } else {
      return textValue == ''
          ? Container(
              width: 70,
            )
          : Container(
              height: 70.0,
              width: 70.0,
              decoration: isNumeric(textValue) || textValue == '.'
                  ? BoxDecoration()
                  : BoxDecoration(
                      color: Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[100],
                          blurRadius: 2.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50.0),
                    ),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                onPressed: () {
                  calculation(textValue);
                },
                child: Text(
                  '$textValue',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300,
                    shadows: [
                      Shadow(
                          offset: Offset(0.0, 3.0),
                          blurRadius: 3.0, 
                          color: Colors.black45),
                    ],
                  ),
                ),
              ),
            );
    }
  }
}
