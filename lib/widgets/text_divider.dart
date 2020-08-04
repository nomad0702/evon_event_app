import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            indent: 40,
            endIndent: 20,
            thickness: 1.5,
          ),
        ),
        Text('or'),
        Expanded(
          child: Divider(
            thickness: 1.5,
            indent: 20,
            endIndent: 40,
          ),
        ),
      ],
    );
  }
}
