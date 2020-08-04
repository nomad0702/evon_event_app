import 'package:flutter/material.dart';

class FindEventsNear extends StatelessWidget {
  final Color textColor;

  const FindEventsNear({
    Key key,
    @required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Find Events Near',
          style: TextStyle(
            color: textColor,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: <Widget>[
            Text(
              'Los Angeles, CA',
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.keyboard_arrow_down,
              color: textColor,
              size: 25,
            )
          ],
        ),
      ],
    );
  }
}
