import 'package:get/get.dart';
import 'package:movie_app/core/services/toast_service.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:movie_app/features/movie/domain/entities/params/get_movies_params.dart';
import 'package:movie_app/features/movie/domain/usecases/get_now_playing_movies.dart';
import 'package:movie_app/features/movie/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/features/movie/domain/usecases/get_top_rated_movies.dart';
import 'package:movie_app/features/movie/domain/usecases/get_upcoming_movies.dart';

class HomeController extends GetxController {

  static HomeController get to => Get.find();

  final GetNowPlayingMovies getNowPlayingMovies;
  final GetUpcomingMovies getUpcomingMovies;
  final GetTopRatedMovies getTopRatedMovies;
  final GetPopularMovies getPopularMovies;

  HomeController({
    required this.getNowPlayingMovies,
    required this.getUpcomingMovies,
    required this.getTopRatedMovies,
    required this.getPopularMovies,
  });

  final nowPlayingMovies = RxList<Movie>([]);
  final upcomingMovies = RxList<Movie>([]);
  final topRatedMovies = RxList<Movie>([]);
  final popularMovies = RxList<Movie>([]);
  
  final nowPlayingLoading = RxBool(false);
  final upcomingLoading = RxBool(false);
  final topRatedLoading = RxBool(false);
  final popularLoading = RxBool(false);

  Future<void> init() async {
    fetchNowPlayingMovie();
    fetchUpcomingMovie();
    fetchTopRatedMovie();
    fetchPopularMovie();
  }

  Future<void> fetchNowPlayingMovie() async {
    nowPlayingLoading.value = true;
    
    final response = await getNowPlayingMovies.call(GetMoviesParams(
      page: 1
    ));

    response.fold(
      (error) {
        nowPlayingLoading.value = false;
        toast.showToastError('Faile to get Now Playing Movies');
      }, 
      (result) {
        nowPlayingLoading.value = false;
        nowPlayingMovies.value = result ?? [];
      }
    );
  }

  Future<void> fetchUpcomingMovie() async {
    upcomingLoading.value = true;
    
    final response = await getUpcomingMovies.call(GetMoviesParams(
      page: 1
    ));

    response.fold(
      (error) {
        upcomingLoading.value = false;
        toast.showToastError('Faile to get Now Playing Movies');
      }, 
      (result) {
        upcomingLoading.value = false;
        upcomingMovies.value = result ?? [];
      }
    );
  }

  Future<void> fetchTopRatedMovie() async {
    topRatedLoading.value = true;
    
    final response = await getTopRatedMovies.call(GetMoviesParams(
      page: 1
    ));

    response.fold(
      (error) {
        topRatedLoading.value = false;
        toast.showToastError('Faile to get Now Playing Movies');
      }, 
      (result) {
        topRatedLoading.value = false;
        topRatedMovies.value = result ?? [];
      }
    );
  }

  Future<void> fetchPopularMovie() async {
    popularLoading.value = true;
    
    final response = await getPopularMovies.call(GetMoviesParams(
      page: 1
    ));

    response.fold(
      (error) {
        popularLoading.value = false;
        toast.showToastError('Faile to get Now Playing Movies');
      }, 
      (result) {
        popularLoading.value = false;
        popularMovies.value = result ?? [];
      }
    );
  }

}