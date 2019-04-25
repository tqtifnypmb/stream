import 'package:flutter/material.dart';
import '../widgets/searchAppBar.dart';

class Search extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      body: Center(
        child: Text('Search'),
      ),
    ); 
  }
}