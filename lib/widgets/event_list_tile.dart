import 'package:flutter/material.dart';

import '../screens/event_detail_screen.dart';

class EventListTile extends StatelessWidget {
  const EventListTile({
    Key key,
    @required this.date,
    @required this.title,
    @required this.location,
  }) : super(key: key);

  final String date;
  final String title;
  final String location;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, EventDetailScreen.routeName),
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).primaryColor,
        child: Text(
          date,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(location),
    );
  }
}
