class PostRateMovieParams {
    PostRateMovieParams({
        required this.movieId,
        required this.value,
    });

    final int movieId;
    final double value;

    Map<String, dynamic> toJson() => {
      "value": value
    };
}
