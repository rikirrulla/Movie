import 'package:flutter/material.dart';
import 'package:movie/src/business_logic/utils/constants.dart';

class TitleAndType extends StatelessWidget {
  const TitleAndType({
    this.title,
    this.type,
    Key key,
  }) : super(key: key);
  final String type;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16,
              fontFamily: fontSemi,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10,),
        Text(
          type,
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 12,
              fontFamily: fontSemi,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}