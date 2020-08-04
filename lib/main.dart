import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import './screens/init_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF449BFF),
        accentColor: Color(0xFF3D56FC),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InitScreen(),
      routes: {
        SignupScreen.routeName: (context) => SignupScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
