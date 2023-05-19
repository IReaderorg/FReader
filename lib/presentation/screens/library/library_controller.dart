import 'package:get/get.dart';

import '../explore/explore_controller.dart';

class LibraryController extends GetxController {
  final title = 'Library'.obs;
}

class LibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LibraryController());
  }
}

