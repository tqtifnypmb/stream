import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../redux/store.dart';
import '../redux/state.dart';

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
        return createCell(tweet: tweet);
      },
    );
  }

  void _pushMy() {
    Navigator.of(context, rootNavigator: true).pushNamed('/my');
  }

  Widget createCell({tweet: Tweet}) {
    final avatar = Container(
      width: 44,
      height: 44,
  
      margin: EdgeInsets.only(left: 12.0, right: 8.0),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0)
      ),

      child: CupertinoButton(
        child: Image.network(tweet.avatarURL),
        onPressed: _pushMy
      ),
      
    );

    final metaInfoRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: <Widget>[
        Text(tweet.senderName),

        CupertinoButton(
          child: Text('more'),
          onPressed: null,
        )
      ],
    );

    final contentColumn = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: <Widget>[
        metaInfoRow,
        Text(tweet.text),
      ],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      
      children: <Widget>[
        avatar,

        Expanded(
          child: Container(
            padding: EdgeInsets.only(right: 8),
            child: contentColumn
          ),
        )
      ],
    );
  }

  void _storeChanged() {
    final newTweets = Store.shared.getState().timelines();
    this.setState(() {
      _tweets = newTweets;
    });
  }
}