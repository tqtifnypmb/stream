import 'package:flutter/cupertino.dart';
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('My'),
      ),
      child: TweetsWidget()
    );
  }

  List<Widget> _createSliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return [];
  }

  void _scrollListener() {

  }
}