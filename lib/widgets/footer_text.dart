import 'package:flutter/material.dart';

class FooterText extends StatelessWidget {
  final String plainText;
  final String linkText;
  final Function onTap;

  const FooterText({
    Key key,
    @required this.plainText,
    @required this.linkText,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(plainText),
        GestureDetector(
          child: Text(
            linkText,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
