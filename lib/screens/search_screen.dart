import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/gradient_bar.dart';
import '../widgets/section_title.dart';
import './event_list_screen.dart';
import '../screens/filter_screen.dart';
import '../widgets/bottom_bar.dart';

class SearchScreen extends StatelessWidget {
  static final String routeName = '/search';

  final List categories = DummyData.categories;

  final int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.tune),
            onPressed: () =>
                Navigator.pushNamed(context, FilterScreen.routeName),
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
                padding: const EdgeInsets.only(top: 35),
                height: 130,
                child: Column(
                  children: <Widget>[
                    HeaderInputField(
                      icon: Icons.search,
                      hintText: 'Search Upcoming Events',
                    ),
                    SizedBox(height: 8),
                    HeaderInputField(
                      icon: Icons.room,
                      hintText: 'Los Angeles, CA',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            SectionTitle(title: 'BROWSE BY CATEGORY'),
            VerticalCategoryBrowser(categories: categories),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
      ),
    );
  }
}

class HeaderInputField extends StatelessWidget {
  final IconData icon;
  final String hintText;

  const HeaderInputField({
    Key key,
    @required this.icon,
    @required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      margin: const EdgeInsets.symmetric(horizontal: 60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Theme.of(context).primaryColorDark,
            Theme.of(context).accentColor,
          ],
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white60,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white60),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class VerticalCategoryBrowser extends StatelessWidget {
  const VerticalCategoryBrowser({
    Key key,
    @required this.categories,
  }) : super(key: key);

  final List categories;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0, left: 15),
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) => HorizontalCategoryCard(
          title: categories[index]['title'],
          icon: categories[index]['icon'],
          foregroundColor: categories[index]['foregroundColor'],
          backgroundColor: categories[index]['backgroundColor'],
        ),
      ),
    );
  }
}

class HorizontalCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color foregroundColor;
  final Color backgroundColor;

  const HorizontalCategoryCard({
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
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                color: backgroundColor,
                child: Icon(
                  icon,
                  color: foregroundColor,
                ),
              ),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: foregroundColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Divider(
            indent: 60,
          ),
        ],
      ),
    );
  }
}
