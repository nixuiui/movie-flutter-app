enum NetworkFailureType {
  badConnection,
  badRequest,
  noInternetConnection,
  server,
  unknown,
}

class NetworkFailureError extends Error {
  final NetworkFailureType type;
  final String title;
  final String description;

  factory NetworkFailureError({
    required String message,
    required NetworkFailureType type,
  }) {
    switch (type) {
      case NetworkFailureType.badConnection:
        return NetworkFailureError.badConnection(message);
      case NetworkFailureType.badRequest:
        return NetworkFailureError.badRequest(message);
      case NetworkFailureType.noInternetConnection:
        return NetworkFailureError.noInternetConnection(message);
      case NetworkFailureType.server:
        return NetworkFailureError.server(message);
      default:
        return NetworkFailureError._(
            title: message,
            description: message,
            type: NetworkFailureType.unknown);
    }
  }

  NetworkFailureError._({
    required this.title,
    required this.description,
    required this.type,
  });

  NetworkFailureError.noInternetConnection([String message = ''])
      : this._(
          title: 'Tidak ada koneksi Internet',
          description: message,
          type: NetworkFailureType.noInternetConnection,
        );

  NetworkFailureError.badConnection([String message = ''])
      : this._(
          title: 'Koneksi Internet bermasalah',
          description: message,
          type: NetworkFailureType.badConnection,
        );

  NetworkFailureError.badRequest([String message = ''])
      : this._(
          title: 'Koneksi Internet bermasalah',
          description: message,
          type: NetworkFailureType.badConnection,
        );

  NetworkFailureError.server([String message = ''])
      : this._(
          title: 'Server mengalami gangguan',
          description: message,
          type: NetworkFailureType.server,
        );
}
