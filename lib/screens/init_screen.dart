import 'package:flutter/material.dart';

import '../widgets/gradient_button.dart';
import './signup_screen.dart';
import './login_screen.dart';
import './home_screen.dart';

class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 200),
            Image.asset('assets/images/logo.png'),
            SizedBox(height: 10),
            Text(
              'EVON',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(40),
              child: Text(
                'Discover upcoming events near you',
                style: TextStyle(fontSize: 24, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 80),
            GradientButton(
              label: 'Sign Up',
              margin: 40,
              onPressed: () {
                Navigator.pushNamed(context, SignupScreen.routeName);
              },
            ),
            SizedBox(height: 10),
            SimpleButton(),
            SizedBox(height: 40),
            FlatButton(
              child: Text(
                'Skip for now',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 1.5),
      ),
      child: FlatButton(
        onPressed: () => Navigator.pushNamed(context, LoginScreen.routeName),
        child: Text(
          'Log in',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
