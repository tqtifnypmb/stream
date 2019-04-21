import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/my.dart';

void main() => runApp(Stream());

class Stream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream',

      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/my': (context) => My(),
      },
    );
  }
}