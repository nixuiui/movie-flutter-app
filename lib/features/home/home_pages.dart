import 'package:get/get.dart';

import 'home_routes.dart';
import 'presentation/pages/home_page.dart';

final homePages = [
  GetPage(
    name: homeRoutes.home,
    page: () => const HomePage(),
    participatesInRootNavigator: true,
    preventDuplicates: true,
  ),
];