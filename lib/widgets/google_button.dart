import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoogleButton extends StatelessWidget {
  final String label;
  const GoogleButton({
    this.label,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            height: 48,
            width: 48,
            child: SvgPicture.asset(
              'assets/icons/google.svg',
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {},
              child: Text(
                label,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
