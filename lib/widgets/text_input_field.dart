import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final Widget child;

  const TextInputField({
    @required this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF1F5FB),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: child,
    );
  }
}
