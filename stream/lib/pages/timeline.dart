import 'package:flutter/material.dart';
import '../widgets/tweetsWidget.dart';

class Timeline extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _createTabView();
  }

  Widget _createTabView() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timeline'),
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.headset),
          ),

          IconButton(
            icon: Icon(Icons.dashboard),
          )
        ],
      ),
      body: TweetsWidget(),
    );
  }
}