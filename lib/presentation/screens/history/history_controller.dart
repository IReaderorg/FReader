import 'package:get/get.dart';

import '../explore/explore_controller.dart';

class HistoryController extends GetxController {
  final title = 'Library'.obs;
}

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}