import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget with PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    var searchBar = _createSearchBar();

    searchBar = SafeArea(
      child: searchBar,
      top: true,
    );

    searchBar = Align(
      alignment: Alignment.topCenter,
      child: searchBar,
    );

    return Container(
      color: Colors.lightBlue,
      child: Material(
        child: searchBar,
        color: Colors.lightBlue,
        elevation: 4,
      )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  Widget _createSearchBar() {
    final avatar = Container(
      width: 44,
      height: 44,
     
      margin: EdgeInsets.only(left: 12.0, right: 8.0),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0)
      ),

      child: IconButton(
        icon: Image.network('https://img3.doubanio.com/icon/ul2771112-56.jpg'),
        onPressed: null
      ),
      
    );

    final searchBar = TextField();

    final cancelButton = FlatButton(
      child: Text('Cancel'),
      color: Colors.blue,
      onPressed: null,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,

      children: <Widget>[
        avatar,

        // searchBar,

        cancelButton
      ],
    );
  }
}