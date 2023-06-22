import 'package:intl/intl.dart';

class GetMoviesParams {
    GetMoviesParams({
        this.language,
        this.page,
    });

    final String? language;
    final int? page;

    Map<String, dynamic> movieListParams() => {
        "language": language ?? 'en-US',
        "page": page ?? 1,
        "release_date.lte": DateFormat('y-MM-dd').format(DateTime.now()),
        "sort_by": "release_date.desc"
    };

    Map<String, dynamic> withPaginationOnly() => {
        "language": language ?? 'en-US',
        "page": page ?? 1,
    };
}
