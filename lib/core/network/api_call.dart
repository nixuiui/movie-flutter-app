import 'package:dartz/dartz.dart';

import 'network_exceptions.dart';

/// Function for mapping api call into either success or failure.
Future<Either<NetworkException, T>> apiCall<T>(Future<T> func) async {
  try {
    final result = await func;
    return Right(result);
  } on NetworkException catch(e) {
    return Left(e);
  }
}