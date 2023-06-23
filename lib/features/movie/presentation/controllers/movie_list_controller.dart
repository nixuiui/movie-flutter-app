import 'dart:async';

import 'package:get/get.dart';
import 'package:movie_app/core/const/enum.dart';
import 'package:movie_app/core/services/toast_service.dart';
import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:movie_app/features/movie/domain/entities/params/get_movies_params.dart';
import 'package:movie_app/features/movie/domain/usecases/get_genres.dart';
import 'package:movie_app/features/movie/domain/usecases/get_movies.dart';

class MovieListController extends GetxController {
  
  static MovieListController get to => Get.find();

  final GetMovies getMovies;
  final GetGenres getGenres;
  
  MovieListController({
    required this.getMovies,
    required this.getGenres,
  });

  final loadingList = RxBool(false);

  var page = 1;
  final perPage = 20;
  final mealScrollThreshold = 200.0;
  final mealHasReachedMax = RxBool(false);

  final genres = RxList<Genre>([]);
  final selectedGenre = RxList<Genre>([]);
  final sort = Rx<SortOption>(SortOption.popular);

  final movies = RxList<Movie>([]);

  void init() async {
    page = 1;
    fetchMoviesData();
    fetchGenres();
  }

  Future<void> refreshData() async {
    fetchGenres();
    page = 1;
    mealHasReachedMax.value = false;
    movies.value = [];
    loadingList.value = true;
    await fetchMoviesData();
  }

  Future<void> loadMore(double maxScroll, double currentScroll) async {
    if (
      (maxScroll - currentScroll) <= mealScrollThreshold && 
      !mealHasReachedMax.value && 
      !loadingList.value
    ) {
      await fetchMoviesData();
    }
  }

  Future<void> fetchMoviesData() async {
    loadingList.value = true;

    var currentData = movies;

    final response = await getMovies.call(GetMoviesParams(
      page: page,
      sort: sort.value,
      genre: selectedGenre
    ));

    response.fold(
      (error) {
        loadingList.value = false;
        toast.showToastError('$error');
      }, 
      (result) {
        loadingList.value = false;
        if(result?.isEmpty ?? true) {
          mealHasReachedMax.value = true;
        } else if((result?.length ?? 0) < perPage) {
          mealHasReachedMax.value = true;
        }

        if(page == 1) {
          movies.value = result ?? [];
          loadingList.value = false;
        } else {
          currentData.addAll(result ?? []);
          movies.value = [...currentData];
          loadingList.value = false;
        }

        updatePage();
      }
    );
  }

  void updatePage() {
    var length = movies.length;
    if(length%page > 0) {
      mealHasReachedMax.value = true;
    } else {
      page = (length/perPage).ceil() + 1;
    }
  }

  void setSort(SortOption value) {
    sort.value = value;
    refreshData();
  }

  void setGenres(List<Genre> value) {
    selectedGenre.value = value;
    refreshData();
  }

  Future<void> fetchGenres() async {
    final response = await getGenres.call(NoParams());

    response.fold(
      (error) {
        toast.showToastError('$error');
      }, 
      (result) {
        genres.value = result ?? [];
      }
    );
  }
  
}
