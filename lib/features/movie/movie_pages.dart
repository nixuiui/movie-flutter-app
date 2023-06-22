import 'package:get/get.dart';

import 'movie_routes.dart';
import 'presentation/pages/movie_page.dart';

final homePages = [
  GetPage(
    name: movieRoutes.movie,
    page: () => const MoviePage(),
    participatesInRootNavigator: true,
    preventDuplicates: true,
  ),
];