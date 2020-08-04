import 'package:flutter/material.dart';

class GradientBar extends StatelessWidget {
  final Widget child;

  const GradientBar({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Theme.of(context).primaryColor,
          Theme.of(context).accentColor,
        ]),
      ),
      child: child,
    );
  }
}
