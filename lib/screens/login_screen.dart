import 'package:evon_event_app/widgets/footer_text.dart';
import 'package:flutter/material.dart';

import '../widgets/gradient_button.dart';
import '../widgets/facebook_button.dart';
import '../screens/signup_screen.dart';
import '../widgets/google_button.dart';
import '../widgets/text_divider.dart';
import '../widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 120),
            Image.asset('assets/images/logo.png'),
            SizedBox(height: 80),
            LoginForm(),
            FlatButton(
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onPressed: () {},
            ),
            TextDivider(),
            SizedBox(height: 10),
            FacebookButton(
              label: 'Log in with Facebook',
            ),
            SizedBox(height: 15),
            GoogleButton(
              label: 'Log in with Google',
            ),
            SizedBox(height: 60),
            FooterText(
              plainText: 'Don\'t have an account? ',
              linkText: 'Sign Up',
              onTap: () => Navigator.pushReplacementNamed(
                  context, SignupScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          TextInputField(
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 15),
          TextInputField(
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 15),
          GradientButton(
            label: 'Log In',
            margin: 40,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
