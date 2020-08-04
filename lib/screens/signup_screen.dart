import 'package:flutter/material.dart';

import '../widgets/gradient_button.dart';
import '../widgets/facebook_button.dart';
import '../screens/login_screen.dart';
import '../widgets/google_button.dart';
import '../widgets/text_divider.dart';
import '../widgets/text_input_field.dart';
import '../widgets/footer_text.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80),
            Image.asset('assets/images/logo.png'),
            SizedBox(height: 50),
            SignupForm(),
            SizedBox(height: 30),
            TextDivider(),
            SizedBox(height: 10),
            FacebookButton(
              label: 'Sign Up with Facebook',
            ),
            SizedBox(height: 15),
            GoogleButton(
              label: 'Sign Up with Google',
            ),
            SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By signing up you accept the ',
                  style: TextStyle(color: Colors.black54),
                  children: [
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 35),
            FooterText(
              plainText: 'Already have an account? ',
              linkText: 'Log in',
              onTap: () => Navigator.pushReplacementNamed(
                  context, LoginScreen.routeName),
            )
          ],
        ),
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          TextInputField(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Full Name',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 15),
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
            label: 'Sign Up',
            margin: 40,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
