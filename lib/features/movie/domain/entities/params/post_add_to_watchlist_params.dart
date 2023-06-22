class PostAddToWatchListParams {
    PostAddToWatchListParams({
        required this.mediaId,
        required this.favorite,
    });

    final int mediaId;
    final int favorite;

    Map<String, dynamic> toJson() => {
      "media_type": "movie",
      "media_id": mediaId,
      "watchlist": favorite
    };
}
