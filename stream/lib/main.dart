import 'package:flutter/cupertino.dart';
import 'pages/home.dart';

void main() => runApp(Stream());

class Stream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Stream',
  
      home: Home()
    );
  }
}