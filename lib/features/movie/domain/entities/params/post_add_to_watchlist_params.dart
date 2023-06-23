class PostAddToWatchListParams {
    PostAddToWatchListParams({
        required this.mediaId,
        required this.watchlist,
    });

    final int mediaId;
    final bool watchlist;

    Map<String, dynamic> toJson() => {
      "media_type": "movie",
      "media_id": mediaId,
      "watchlist": watchlist
    };
}
