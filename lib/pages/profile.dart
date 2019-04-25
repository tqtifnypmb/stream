import 'package:flutter/material.dart';
import '../widgets/tweetCell.dart';
import '../redux/store.dart';
import '../redux/state.dart';

class Profile extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  
  ScrollController _scrollController;
  TabController _tabController;
  List<Tweet> _tweets = [];
  
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(this._scrollListener);

    _tabController = TabController(length: 4, vsync: this);

    Store.shared.register(listener: this._storeChanged);
    this._storeChanged();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        final overlapObserver = SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          child: _createSliverAppBar()
        );
        return [overlapObserver];
      },

      body: Builder(
        builder: (BuildContext context) => _createBody(context),
      )
    );
  }

  Widget _createSliverAppBar() {
    return SliverAppBar( 
      expandedHeight: 200.0,
      title: Text('Profile'),
      backgroundColor: Colors.lightBlue,
      floating: false,
      pinned: true,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
                    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.cover,
                  ),
      ),

      bottom: _createTabBar(),
    );
  }

  Widget _createTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: <Widget>[
        Tab(
          text: '推文',
        ),

        Tab(
          text: '推文和回复',
        ),

        Tab(
          text: '媒体',
        ),

        Tab(
          text: '喜欢',
        )
      ],
    );
  }

  Widget _createBody(BuildContext context) {

    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        _createTimelineTab(context),
        _createTimelineTab(context),
        _createTimelineTab(context),
        _createTimelineTab(context)
      ],
    );
  }

  Widget _createTimelineTab(BuildContext context) {
    final overlayInjector = SliverOverlapInjector(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
    );
    final sliverPadding = SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
            final tweet = _tweets[index];
            return TweetCell(tweet);
          },

          childCount: this._tweets.length), 
        ),
    );

    final scrollView = CustomScrollView(
      slivers: <Widget>[
        overlayInjector,
        sliverPadding
      ],
    );

    return Material(
      child: scrollView
    );
  }

  void _scrollListener() {

  }

  void _storeChanged() {
    final newTweets = Store.shared.getState().timelines();
    this.setState(() {
      _tweets = newTweets;
    });
  }
}