
import 'package:FReader/presentation/screens/library/library_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryScreen extends StatelessWidget {


  final _libraryController = Get.put(LibraryController());

  LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:GestureDetector(
          onTap: () => {

          },
          child: Text( "Library"),
        ),
      ),
      body: Obx(() => ListView.builder(
      itemCount: _libraryController.books.length,
      itemBuilder: (context, index) => ListTile(
      leading: Text(_libraryController.books[index].title),
      ),
    )
      ),
    );
  }
}
