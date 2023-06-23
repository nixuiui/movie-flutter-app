import 'package:intl/intl.dart';
import 'package:movie_app/core/const/enum.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';

class GetMoviesParams {
    GetMoviesParams({
        this.language,
        this.page,
        this.sort,
        this.genre,
    });

    final String? language;
    final int? page;
    final SortOption? sort;
    final List<Genre>? genre;

    Map<String, dynamic> movieListParams() => {
        "language": language ?? 'en-US',
        "page": page ?? 1,
        "release_date.lte": DateFormat('y-MM-dd').format(DateTime.now()),
        "sort_by": sort?.value,
        "with_genres": genre?.map((e) => e.id).join(','),
    };

    Map<String, dynamic> withPaginationOnly() => {
        "language": language ?? 'en-US',
        "page": page ?? 1,
    };
}
