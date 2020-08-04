import 'package:flutter/material.dart';

class EventCardFooter extends StatelessWidget {
  const EventCardFooter({
    Key key,
    @required this.category,
  }) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              ' $category ',
              style: TextStyle(
                  color: Colors.grey, backgroundColor: Colors.grey[300]),
            ),
          ),
          Icon(
            Icons.share,
            color: Colors.grey,
          ),
          SizedBox(width: 10),
          Icon(
            Icons.star_border,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
