import 'package:get/get.dart';
import 'package:movie_app/core/services/toast_service.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:movie_app/features/movie/domain/usecases/get_movie_detail.dart';

class MovieDetailController extends GetxController {

  static MovieDetailController get to => Get.find();

  final GetMovieDetail getMovieDetail;

  MovieDetailController({
    required this.getMovieDetail,
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



}