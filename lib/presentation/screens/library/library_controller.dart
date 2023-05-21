import 'package:FReader/data/db/database_handler.dart';
import 'package:FReader/domain/model/book.dart';
import 'package:get/get.dart';

import '../explore/explore_controller.dart';

class LibraryController extends GetxController {
  final title = 'Library'.obs;
  List<Book> books =  <Book>[].obs;
  @override
  void onInit() {
    _getData();
   // AppDatabaseHelper.instance.insert(Book(id: null,sourceId: 1, title: "Test Book", key: "https://www.google.com/", description: "fake desc"));
    super.onInit();
  }
  void _getData() {
    AppDatabaseHelper.instance.getLibraryBooks().then((value) {
      value.forEach((element) {
        books.add(Book.fromMap(element));
      });
    });
  }
}

class LibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LibraryController());
  }
}

