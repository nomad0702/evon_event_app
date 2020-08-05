import 'package:evon_event_app/screens/filter_screen.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/gradient_bar.dart';
import '../widgets/find_events_near.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/event_list_tile.dart';
import '../widgets/event_card_footer.dart';

class EventListScreen extends StatelessWidget {
  static final String routeName = '/events';

  final List events = DummyData.events;

  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Adventure Events',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          children: <Widget>[
            GradientBar(
              child: Container(
                height: 80,
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: FindEventsNear(
                textColor: Colors.black,
              ),
            ),
            ButtonGroup(),
            VerticalEventListView(events: events),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
      ),
    );
  }
}

class ButtonGroup extends StatelessWidget {
  const ButtonGroup({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FilterButton(),
          SortButton(
            label: 'Popular',
          ),
          SortButton(
            label: 'This week',
          ),
          SortButton(
            label: 'Adventure',
          ),
        ],
      ),
    );
  }
}

class VerticalEventListView extends StatelessWidget {
  const VerticalEventListView({
    Key key,
    @required this.events,
  }) : super(key: key);

  final List events;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 15),
        itemCount: events.length,
        itemBuilder: (context, index) => HorizontalEventCard(
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

class HorizontalEventCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String imageUrl;
  final String category;

  const HorizontalEventCard({
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
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        elevation: 3,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3.0),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 60,
                    ),
                  ),
                ),
                Expanded(
                  child: EventListTile(
                      date: date, title: title, location: location),
                )
              ],
            ),
            Divider(
              indent: 8.0,
              endIndent: 8.0,
            ),
            EventCardFooter(category: category),
          ],
        ),
      ),
    );
  }
}

class SortButton extends StatelessWidget {
  final String label;
  const SortButton({
    Key key,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Theme.of(context).primaryColor,
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Row(
        children: <Widget>[
          Text(
            ' $label ',
            style: TextStyle(color: Colors.white),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 15,
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, FilterScreen.routeName),
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          border: Border.all(color: Colors.grey[400]),
          color: Colors.grey[200],
        ),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.tune,
              size: 15,
            ),
            Text(' Filter '),
          ],
        ),
      ),
    );
  }
}
