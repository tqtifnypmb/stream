import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/profile.dart';

void main() => runApp(Stream());

class Stream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream',

      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/profile': (context) => Profile(),
      },
    );
  }
}