import 'package:get/get.dart';
import 'package:movie_app/core/services/dialog_service.dart';
import 'package:movie_app/core/services/toast_service.dart';
import 'package:movie_app/features/movie/domain/usecases/get_movies.dart';
import 'package:movie_app/features/movie/domain/usecases/get_now_playing_movies.dart';
import 'package:movie_app/features/movie/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/features/movie/domain/usecases/get_top_rated_movies.dart';
import 'package:movie_app/features/movie/domain/usecases/get_upcoming_movies.dart';
import 'package:movie_app/features/movie/presentation/controllers/movie_controller.dart';

import 'core/services/network_service.dart';
import 'features/home/presentation/controllers/home_controller.dart';
import 'features/movie/data/datasource/order_remote_data_source.dart';
import 'features/movie/data/repositories/order_repository_impl.dart';
import 'features/movie/domain/repositories/movie_repository.dart';

abstract class Injector {
  static void init() {
    serviceInjection();
    movieInjection();
    homeInjection();
  }
}

void serviceInjection(){
  Get.put(DialogService());
  Get.put(NetworkService());
  Get.put(ToastService());
}

Future<void> movieInjection() async {
  
  Get.lazyPut<MovieRepository>(() => MovieRepositoryImpl(
    remoteDataSource: MovieRemoteDataSourceImpl(NetworkService()),
  ));

  Get.lazyPut(() => GetMovies(Get.find()));
  Get.lazyPut(() => GetNowPlayingMovies(Get.find()));
  Get.lazyPut(() => GetPopularMovies(Get.find()));
  Get.lazyPut(() => GetTopRatedMovies(Get.find()));
  Get.lazyPut(() => GetUpcomingMovies(Get.find()));

  Get.put(MovieController());
}

Future<void> homeInjection() async {
  Get.put(HomeController(
    getNowPlayingMovies: Get.find(),
    getUpcomingMovies: Get.find(),
    getTopRatedMovies: Get.find(),
    getPopularMovies: Get.find(),
  ));
}