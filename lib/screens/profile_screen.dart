import 'package:evon_event_app/dummy_data.dart';
import 'package:evon_event_app/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

import '../screens/filter_screen.dart' show SmallSectionTitle;
import '../widgets/gradient_bar.dart';
import '../widgets/gradient_button.dart';

class ProfileScreen extends StatelessWidget {
  static final routeName = '/profile';

  final categories = DummyData.categories;

  final int _currentIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProfileHeader(),
            SizedBox(height: 30),
            GradientButton(
              label: '+  Create New Event',
              margin: 30,
              onPressed: () {},
            ),
            SizedBox(height: 10),
            SmallSectionTitle(title: 'Interests'),
            InterestsChip(categories: categories),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
      ),
    );
  }
}

class InterestsChip extends StatelessWidget {
  const InterestsChip({
    Key key,
    @required this.categories,
  }) : super(key: key);

  final List categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Wrap(
        spacing: 8,
        children: categories
            .map(
              (category) => Chip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                backgroundColor: category['backgroundColor'],
                label: Text(
                  category['title'],
                  style: TextStyle(color: category['foregroundColor']),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBar(
      child: Container(
        height: 300,
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),
            CircleAvatar(
              maxRadius: 30,
              backgroundImage: AssetImage(
                'assets/images/avatar0.png',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Johan Eric',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      '3',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Events',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    '|',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '7',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Following',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
