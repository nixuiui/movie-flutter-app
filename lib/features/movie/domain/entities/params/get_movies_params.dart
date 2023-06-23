import 'package:intl/intl.dart';
import 'package:movie_app/core/const/enum.dart';

class GetMoviesParams {
    GetMoviesParams({
        this.language,
        this.page,
        this.sort,
    });

    final String? language;
    final int? page;
    final SortOption? sort;

    Map<String, dynamic> movieListParams() => {
        "language": language ?? 'en-US',
        "page": page ?? 1,
        "release_date.lte": DateFormat('y-MM-dd').format(DateTime.now()),
        "sort_by": sort?.value
    };

    Map<String, dynamic> withPaginationOnly() => {
        "language": language ?? 'en-US',
        "page": page ?? 1,
    };
}
