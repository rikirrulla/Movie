import 'package:flutter/material.dart';
import 'package:movie/src/business_logic/utils/constants.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBorder;
  final Function onPress;

  ButtonWidget({Key key, this.title, this.hasBorder,this.onPress});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder ? kWhiteColor : kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
          border: hasBorder
              ? Border.all(
                  color: kPrimaryColor,
                  width: 1.0,
                )
              : Border.fromBorderSide(BorderSide.none),
        ),
        child: Container(
          height: 60.0,
          child: Center(
            child: GestureDetector(
              onTap: onPress,
              child: Text(
                title,
                style: TextStyle(
                  color: hasBorder ? kPrimaryColor : kWhiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  fontFamily: font,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
