import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/gradient_bar.dart';
import '../screens/event_list_screen.dart';
import '../widgets/find_events_near.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/event_list_tile.dart';
import '../widgets/event_card_footer.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  final List categories = DummyData.categories;
  final List events = DummyData.events;

  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GradientBar(
                child: Container(
                  margin: EdgeInsets.only(left: 15, top: 40, bottom: 20),
                  child: FindEventsNear(
                    textColor: Colors.white,
                  ),
                ),
              ),
              SectionTitle(title: 'BROWSE BY CATEGORY'),
              HorizontalCategoryBrowser(categories: categories),
              SectionTitleWithLink(
                title: 'POPULAR EVENTS',
              ),
              HorizontalEventListView(events: events),
              SectionTitleWithLink(
                title: 'NEARBY EVENTS',
              ),
              HorizontalEventListView(events: events),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
      ),
    );
  }
}

class HorizontalEventListView extends StatelessWidget {
  const HorizontalEventListView({
    Key key,
    @required this.events,
  }) : super(key: key);

  final List events;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: events.length,
        itemBuilder: (context, index) => VerticalEventCard(
          title: events[index]['title'],
          location: events[index]['location'],
          date: events[index]['date'],
          imageUrl: events[index]['imageUrl'],
          category: events[index]['category'],
        ),
      ),
    );
  }
}

class VerticalEventCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String imageUrl;
  final String category;

  const VerticalEventCard({
    Key key,
    this.title,
    this.location,
    this.date,
    this.imageUrl,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      margin: const EdgeInsets.only(left: 12, top: 15, right: 10),
      child: Card(
        elevation: 10,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                width: 320,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            EventListTile(date: date, title: title, location: location),
            Divider(
              indent: 8.0,
              endIndent: 8.0,
            ),
            EventCardFooter(category: category)
          ],
        ),
      ),
    );
  }
}

class SectionTitleWithLink extends StatelessWidget {
  final String title;
  final Widget viewAll;
  const SectionTitleWithLink({
    Key key,
    @required this.title,
    this.viewAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 30, right: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            child: Text(
              'View All',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            onTap: () {
              Navigator.pushNamed(context, EventListScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

class HorizontalCategoryBrowser extends StatelessWidget {
  const HorizontalCategoryBrowser({
    Key key,
    @required this.categories,
  }) : super(key: key);

  final List categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(left: 15, top: 15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) => VerticalCategoryCard(
          title: categories[index]['title'],
          icon: categories[index]['icon'],
          foregroundColor: categories[index]['foregroundColor'],
          backgroundColor: categories[index]['backgroundColor'],
        ),
      ),
    );
  }
}

class VerticalCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color foregroundColor;
  final Color backgroundColor;

  const VerticalCategoryCard({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.foregroundColor,
    @required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, EventListScreen.routeName),
      child: Container(
        height: 70,
        width: 100,
        color: backgroundColor,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon,
              color: foregroundColor,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: foregroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
