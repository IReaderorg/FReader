import 'package:FReader/presentation/screens/explore/explore_controller.dart';
import 'package:FReader/presentation/screens/explore/explore_screen.dart';
import 'package:FReader/presentation/screens/history/history_controller.dart';
import 'package:FReader/presentation/screens/history/history_screen.dart';
import 'package:FReader/presentation/screens/home_screen.dart';
import 'package:FReader/presentation/screens/library/library_controller.dart';
import 'package:FReader/presentation/screens/library/library_screen.dart';
import 'package:FReader/presentation/screens/settings/setting_explore.dart';
import 'package:FReader/presentation/screens/settings/settings_controller.dart';
import 'package:FReader/presentation/screens/updates/updates_controller.dart';
import 'package:FReader/presentation/screens/updates/updates_screen.dart';
import 'package:FReader/presentation/themes/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FReader',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      initialRoute: "/home",
      defaultTransition: Transition.fadeIn,
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
          binding: HomeBinding()
        ),
      ],
    );
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = <String>['/library',"/updates",'/history', '/explore', '/settings'];

  void changePage(int index) {
    currentIndex.value = index;
    Get.offAndToNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/library') {
      return GetPageRoute(
        settings: settings,
        page: () => LibraryScreen(),
        binding: LibraryBinding(),
      );
    }
    if (settings.name == '/history') {
      return GetPageRoute(
        settings: settings,
        page: () => HistoryScreen(),
        binding: HistoryBinding(),
      );
    }
    if (settings.name == '/updates') {
      return GetPageRoute(
        settings: settings,
        page: () => UpdateScreen(),
        binding: UpdateBinding(),
      );
    }
    if (settings.name == '/explore') {
      return GetPageRoute(
        settings: settings,
        page: () => ExploreScreen(),
        binding: ExploreBinding(),
      );
    }

    if (settings.name == '/settings') {
      return GetPageRoute(
        settings: settings,
        page: () => SettingScreen(),
        binding: SettingsBinding(),
      );
    }

    return null;
  }
}
class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/library',
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
            () => NavigationBar(
              onDestinationSelected:  controller.changePage,
              selectedIndex: controller.currentIndex.value,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.book),
                  label: 'Library',
                ),
                NavigationDestination(
                  icon: Icon(Icons.update),
                  label: 'Updates',
                ),
                NavigationDestination(
                  icon: Icon(Icons.history),
                  label: 'History',
                ),
                NavigationDestination(
                  icon: Icon(Icons.explore),
                  label: 'Browse',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.settings),
                  icon: Icon(Icons.settings),
                  label: 'Explore',
                ),
              ],
        ),
      ),
    );
  }
}












