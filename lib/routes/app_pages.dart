import 'package:movie_app/features/home/home_pages.dart';
import 'package:movie_app/features/home/home_routes.dart';
import 'package:movie_app/features/movie/movie_pages.dart';

class AppPages {
  AppPages._();

  static final initial = homeRoutes.home;

  static final routes = [
    ...homePages,
    ...moviePages,
  ];
}
