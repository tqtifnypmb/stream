import 'package:flutter/material.dart';
import '../redux/state.dart';

typedef _VoidCallback = void Function();

class TweetCell extends StatefulWidget {
  final Tweet tweet;
  final _VoidCallback onAvatarClicked;
  TweetCell(this.tweet, { this.onAvatarClicked });

  @override
  State<StatefulWidget> createState() {
    return _TweetCellState(tweet, onAvatarClicked: onAvatarClicked);
  }
}

class _TweetCellState extends State<TweetCell> {

  final Tweet tweet;
  final _VoidCallback onAvatarClicked;
  List<Future<Image>> imageFutures;

  _TweetCellState(this.tweet, { this.onAvatarClicked }): imageFutures = [];

  @override
  void initState() {
    if (tweet.hasImages()) {
      for (var src in tweet.images) {
        final future = Future((){
          return Image.network(src);
        });

        imageFutures.add(future);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final avatar = Container(
      width: 44,
      height: 44,
     
      margin: EdgeInsets.only(left: 12.0, right: 8.0),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0)
      ),

      child: IconButton(
        icon: Image.network(tweet.avatarURL),
        onPressed: this.onAvatarClicked
      ),
      
    );

    final metaInfoRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: <Widget>[
        Text(tweet.senderName),

        FlatButton(
          child: Text('more'),
          onPressed: null,
        )
      ],
    );

    List<Widget> contentList = [
      metaInfoRow,
      Text(tweet.text),
    ];

    if (this.tweet.reference != null) {
      contentList.add(this._createReference(this.tweet));
    } else if (this.imageFutures.isNotEmpty) {
      final gallery = _createIMagesGallery(this.tweet);
      if (gallery != null) {
        final marginedGallery = Container(
          child: gallery,
          margin: EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
        );
        contentList.add(marginedGallery);
      }
    }

    final contentColumn = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: contentList
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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

  Widget _createReference(Tweet tweet) {
    return null;
  }

  Widget _createIMagesGallery(Tweet tweet) {
    Widget clippedImage(Future<Image> future) {
      return FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<Image> snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
            return ClipRRect( 
              child: snapshot.data,
              borderRadius: BorderRadius.circular(8.0),
            );
          } else {
            return Center(
              child: Text('Placeholder'),
            );
          }
        },
      );
    }

    switch (tweet.images.length) {
      case 1: {
        return clippedImage(imageFutures[0]);
      }

      case 2: {
        break;
      }

      case 3: {
        break;
      }

      case 4: {
        break;
      }
    }

    return null;
  }
}