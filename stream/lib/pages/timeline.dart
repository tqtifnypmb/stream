import 'package:flutter/cupertino.dart';
import '../widgets/tweetsWidget.dart';
class Timeline extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _createTabView();
  }

  Widget _createTabView() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('data'),
      ),
      
      child: CupertinoTabView(
        builder: (BuildContext context) {
          return TweetsWidget();
        }
      ),
    ); 
  }
}