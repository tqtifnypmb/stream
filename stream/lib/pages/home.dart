import 'package:flutter/cupertino.dart';
import 'timeline.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: _createTabBar(),
      tabBuilder: (BuildContext context, int index) {
        return Timeline();
      },
    );
  }

  Widget _createTabBar() {
    return CupertinoTabBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.flag)
        ),

        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.flag)
        ),

        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.flag)
        ),

        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.flag)
        )
      ],
    );
  }
}