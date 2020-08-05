import 'package:evon_event_app/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

import '../widgets/gradient_bar.dart';
import '../dummy_data.dart';
import '../screens/search_screen.dart' show VerticalCategoryBrowser;

class FilterScreen extends StatelessWidget {
  static final String routeName = '/filter';

  final categories = DummyData.categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Filter',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Reset',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            onPressed: () {},
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GradientBar(
              child: Container(
                height: 80,
              ),
            ),
            SmallSectionTitle(title: 'Near'),
            NearInputField(),
            SmallSectionTitle(title: 'Sort by'),
            SortbyButtonGroup(),
            SmallSectionTitle(title: 'Time'),
            TimeInputField(),
            TimeButtonGroup(),
            SmallSectionTitle(title: 'Categories'),
            VerticalCategoryBrowser(categories: categories),
            GradientButton(
              margin: 15,
              label: 'Apply',
              onPressed: () {},
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class TimeButtonGroup extends StatelessWidget {
  const TimeButtonGroup({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: <Widget>[
            RaisedButton(
              elevation: 0,
              color: Colors.grey,
              child: Text('All'),
              onPressed: () {},
            ),
            RaisedButton(
              elevation: 0,
              color: Color(0xFFF1F5FB),
              child: Text('Today'),
              onPressed: () {},
            ),
            RaisedButton(
              elevation: 0,
              color: Color(0xFFF1F5FB),
              child: Text('Tomorrow'),
              onPressed: () {},
            ),
            RaisedButton(
              elevation: 0,
              color: Color(0xFFF1F5FB),
              child: Text('Next week'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class TimeInputField extends StatelessWidget {
  const TimeInputField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      color: Color(0xFFF1F5FB),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.calendar_today,
            size: 18,
          ),
          hintText: '     Select date range',
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class SortbyButtonGroup extends StatelessWidget {
  const SortbyButtonGroup({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              elevation: 0,
              color: Colors.grey,
              child: Text('Latest'),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: RaisedButton(
              elevation: 0,
              color: Color(0xFFF1F5FB),
              child: Text('Popularity'),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: RaisedButton(
              elevation: 0,
              color: Color(0xFFF1F5FB),
              child: Text('Nearest'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class NearInputField extends StatelessWidget {
  const NearInputField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xFFF1F5FB),
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.room,
          ),
          hintText: 'Los Angeles, CA',
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class SmallSectionTitle extends StatelessWidget {
  final String title;
  const SmallSectionTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
