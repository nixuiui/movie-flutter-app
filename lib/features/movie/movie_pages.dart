import 'package:get/get.dart';
import 'package:movie_app/features/movie/presentation/pages/movie_detail_page.dart';

import 'movie_routes.dart';
import 'presentation/pages/movie_page.dart';

final moviePages = [
  GetPage(
    name: movieRoutes.movie,
    page: () => const MoviePage(),
    participatesInRootNavigator: true,
    preventDuplicates: true,
  ),
  GetPage(
    name: movieRoutes.detail,
    page: () => const MovieDetailPage(),
    participatesInRootNavigator: true,
    preventDuplicates: true,
  ),
];