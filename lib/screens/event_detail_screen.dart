import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/gradient_button.dart';
import '../widgets/section_title.dart';

class EventDetailScreen extends StatelessWidget {
  static final String routeName = '/event';
  final String imageUrl = DummyData.events[1]['imageUrl'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageHeader(imageUrl: imageUrl),
            SectionTitle(title: 'Mountain Climbing Training'),
            InfoTile(
              icon: Icons.schedule,
              title: 'Janunary 27 - 29',
              subtitle: '10:00am - 06:00pm',
            ),
            InfoTile(
              icon: Icons.location_on,
              title: 'Vector Wero Park Center',
              subtitle: '944 Earline Harbors, Kuphalland, LA 61386',
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('assets/images/map.png'),
              ),
            ),
            SectionTitle(title: '97 people are going'),
            Container(
              margin: const EdgeInsets.only(left: 10),
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/avatar$index.png'),
                  ),
                ),
              ),
            ),
            SectionTitle(title: 'Details'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Text(
                    'Want to be as fit as a mountaineer? Want the lung capacity, upper body strength, and leg endurance of elite mountain climbers? Read on.'),
              ),
            ),
            SizedBox(height: 18),
            GradientButton(
              label: 'Going',
              margin: 15,
              onPressed: () {},
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const InfoTile({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(subtitle),
    );
  }
}

class ImageHeader extends StatelessWidget {
  const ImageHeader({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(imageUrl),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.black38,
                Colors.grey.withOpacity(0.0),
              ],
            ),
          ),
        )
      ],
    );
  }
}
