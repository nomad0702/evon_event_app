import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../screens/event_list_screen.dart' show HorizontalEventCard;
import '../widgets/bottom_bar.dart';
import '../widgets/gradient_button.dart';

class OrganizerScreen extends StatelessWidget {
  static final String routeName = '/organizer';

  final events = DummyData.events;

  final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Organizer',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/organizer.png'),
              maxRadius: 40,
            ),
            SizedBox(height: 10),
            Text(
              'EMK Center for Yoga',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '580 Followers',
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 15),
            GradientButton(
              label: 'Follow',
              margin: 100,
              onPressed: () {},
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'The event industry now includes all sizes from the Olypics down business breakfast meetings. Many industries, charitiable organizations and interest.',
                style: TextStyle(color: Colors.grey[800], height: 1.4),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.grey,
                      child: Text(
                        'UPCOMING EVENTS',
                        style: TextStyle(color: Colors.white70),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text('PAST EVENTS'),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            HorizontalEventCard(
              title: events[0]['title'],
              date: events[0]['date'],
              category: events[0]['category'],
              imageUrl: events[0]['imageUrl'],
              location: events[0]['location'],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
      ),
    );
  }
}
