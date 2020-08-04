import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final double margin;
  final Function onPressed;

  const GradientButton({
    @required this.label,
    @required this.margin,
    @required this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: margin),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Theme.of(context).primaryColor,
          Theme.of(context).accentColor,
        ]),
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
