class PostMarkAsFavoriteParams {
    PostMarkAsFavoriteParams({
        required this.mediaId,
        required this.favorite,
    });

    final int mediaId;
    final bool favorite;

    Map<String, dynamic> toJson() => {
      "media_type": "movie",
      "media_id": mediaId,
      "favorite": favorite
    };
}
