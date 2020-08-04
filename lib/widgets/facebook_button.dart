import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FacebookButton extends StatelessWidget {
  final String label;
  const FacebookButton({
    this.label,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: Color(0xFF426AAD),
      ),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 48,
            width: 48,
            color: Color(0xFF354D89),
            child: SvgPicture.asset(
              'assets/icons/facebook.svg',
              color: Colors.white,
              height: 24,
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {},
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
