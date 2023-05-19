import 'package:get/get.dart';

class ExploreController extends GetxController {
  final title = 'History'.obs;
}

class ExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExploreController());
  }
}