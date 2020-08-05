import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/search_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/organizer_screen.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;

  const BottomBar({
    Key key,
    @required this.currentIndex,
  }) : super(key: key);

  void _onTapHandler(context, index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        break;

      case 1:
        Navigator.pushReplacementNamed(context, SearchScreen.routeName);
        break;

      case 2:
        Navigator.pushReplacementNamed(context, OrganizerScreen.routeName);
        break;

      case 4:
        Navigator.pushReplacementNamed(context, ProfileScreen.routeName);
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Theme.of(context).primaryColor,
      currentIndex: currentIndex,
      onTap: (index) => _onTapHandler(context, index),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          title: Text('Search'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.star,
          ),
          title: Text('Favovite'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
          ),
          title: Text('Message'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          title: Text('My'),
        ),
      ],
    );
  }
}
