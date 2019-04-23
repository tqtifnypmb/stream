import 'package:flutter/material.dart';
import 'timeline.dart';
import 'search.dart';
import 'notices.dart';
import 'message.dart';

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      vsync: this
    );
    _tabController.addListener(this.handleTabSelection);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Timeline(),
          Search(),
          Notices(),
          Message(),
        ],
      ),

      bottomNavigationBar: _createTabBar(),
    );
  }

  Widget _createTabBar() {
    return TabBar(
      controller: _tabController,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.white,
      tabs: <Widget>[
        Tab(
          icon: Icon(
            Icons.timeline,
            color: _tabController.index == 0 ? Colors.lightBlue : Colors.grey),
        ),

        Tab(
          icon: Icon(
            Icons.search,
            color: _tabController.index == 1 ? Colors.lightBlue : Colors.grey),
        ),

        Tab(
          icon: Icon(
            Icons.alarm,
            color: _tabController.index == 2 ? Colors.lightBlue : Colors.grey),
        ),

        Tab(
          icon: Icon(
            Icons.message,
            color: _tabController.index == 3 ? Colors.lightBlue : Colors.grey),
        )
      ],
    );
  }

  void handleTabSelection() {
    setState(() {
      
    });
  }
}