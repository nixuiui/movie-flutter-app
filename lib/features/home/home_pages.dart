import 'package:get/get.dart';
import 'package:movie_app/features/home/presentation/pages/splash_page.dart';

import 'home_routes.dart';
import 'presentation/pages/home_page.dart';

final homePages = [
  GetPage(
    name: homeRoutes.home,
    page: () => const HomePage(),
    participatesInRootNavigator: true,
    preventDuplicates: true,
  ),
  GetPage(
    name: homeRoutes.splash,
    page: () => const SplashPage(),
    participatesInRootNavigator: true,
    preventDuplicates: true,
  ),
];