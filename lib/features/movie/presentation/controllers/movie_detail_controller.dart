import 'package:get/get.dart';
import 'package:movie_app/core/services/toast_service.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:movie_app/features/movie/domain/entities/params/post_add_to_watchlist_params.dart';
import 'package:movie_app/features/movie/domain/entities/params/post_mark_as_favorite_params.dart';
import 'package:movie_app/features/movie/domain/usecases/get_movie_detail.dart';
import 'package:movie_app/features/movie/domain/usecases/post_add_to_watchlist.dart';
import 'package:movie_app/features/movie/domain/usecases/post_mark_as_favorite.dart';

class MovieDetailController extends GetxController {

  static MovieDetailController get to => Get.find();

  final GetMovieDetail getMovieDetail;
  final PostAddToWatchList postAddToWatchList;
  final PostMarkAsFavorite postMarkAsFavorite;

  MovieDetailController({
    required this.getMovieDetail,
    required this.postAddToWatchList,
    required this.postMarkAsFavorite,
  });

  final movie = Rx<Movie?>(null);

  void init({required Movie movie}) async {
    this.movie.value = movie;
    await fetchMovieDetail();
  }

  Future<void> fetchMovieDetail() async {
    final response = await getMovieDetail.call(movie.value!.id!);

    response.fold(
      (error) {
        toast.showToastError('Fetching Movie Detail is Failed');
      }, 
      (result) {
        movie.value = result;
      }
    );
  }

  Future<void> masrkAsFavorite() async {
    final response = await postMarkAsFavorite.call(PostMarkAsFavoriteParams(
      mediaId: movie.value!.id!, 
      favorite: true,
    ));
    response.fold(
      (error) {
        toast.showToastError('Failed mark as Favorite Movie');
      }, 
      (result) {
        toast.showToastSuccess('Success mark as Favorite Movie');
      }
    );
  }

  Future<void> addToWatchlist() async {
    final response = await postAddToWatchList.call(PostAddToWatchListParams(
      mediaId: movie.value!.id!, 
      watchlist: true,
    ));
    response.fold(
      (error) {
        toast.showToastError('Failed add movie to Watchlist');
      }, 
      (result) {
        toast.showToastSuccess('Success add movie to Watchlist');
      }
    );
  }


}