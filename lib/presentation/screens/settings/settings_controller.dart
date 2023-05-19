

import 'package:get/get.dart';

class SettingsController extends GetxController {
  final title = 'Settings'.obs;
}

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }
}