
import 'package:FReader/domain/extensions/sources.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( "Explore"),
      ),
      body: ListView.builder(
        itemCount: sources.length,
        itemBuilder: (context, index) => ListTile(
          leading: Text(sources[index].name),
        ),),
    );
  }
}
