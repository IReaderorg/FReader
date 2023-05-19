import 'package:get/get.dart';

import '../explore/explore_controller.dart';

class UpdateController extends GetxController {
  final title = 'Library'.obs;
}

class UpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateController());
  }
}