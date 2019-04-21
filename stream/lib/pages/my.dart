import 'package:flutter/material.dart';
import '../widgets/tweetsWidget.dart';

class My extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<My> {
  
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(this._scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My'),
        backgroundColor: Colors.lightBlue,
      ),

      body: TweetsWidget(),
    );
  }

  List<Widget> _createSliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return [];
  }

  void _scrollListener() {

  }
}