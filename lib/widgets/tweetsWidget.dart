import 'package:flutter/material.dart';
import '../redux/store.dart';
import '../redux/state.dart';
import 'tweetCell.dart';

class TweetsWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return TweetsState();
  }
}

class TweetsState extends State<TweetsWidget> {

  List<Tweet> _tweets = [];

  @override
  void initState() {
    super.initState();

    Store.shared.register(listener: this._storeChanged);

    // get init state
    this._storeChanged();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tweets.length,
      itemBuilder: (BuildContext context, int index) {
        var tweet = _tweets[index];
        return TweetCell(tweet, onAvatarClicked: _pushMy);
      },
    );
  }

  void _pushMy() {
    Navigator.of(context, rootNavigator: true).pushNamed('/profile');
  }

  void _storeChanged() {
    final newTweets = Store.shared.getState().timelines();
    this.setState(() {
      _tweets = newTweets;
    });
  }
}