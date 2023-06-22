import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    debugPrint('\n');
    debugPrint('--> ${options.method.toUpperCase()} ${'${options.baseUrl}${options.path}'}');
    debugPrint('Headers:');
    options.headers.forEach((k, dynamic v) => debugPrint('$k: $v'));
    debugPrint('queryParameters:');
    options.queryParameters.forEach((k, dynamic v) => debugPrint('- $k: $v'));
    if (options.data != null) {
      debugPrint('Body: ${options.data.toString()}');
    }
    debugPrint('--> END ${options.method.toUpperCase()}');
    handler.next(options);
  }

  @override
  void onError(
    DioError err, 
    ErrorInterceptorHandler handler
  ) {
    debugPrint('\n');
    debugPrint('<-- ${err.message} ${err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL'}');
    debugPrint('${err.response != null ? err.response!.data : 'Unknown Error'}');
    debugPrint('<-- End error');
    handler.next(err);
  }

  @override
  void onResponse(
    Response<dynamic> response, 
    ResponseInterceptorHandler handler
  ) {
    debugPrint('\n\n');
    debugPrint('<--- HTTP CODE : ${response.statusCode} URL : ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    debugPrint('Headers: ');
    printWrapped('Response : ${response.data}');
    debugPrint('<--- END HTTP');
    handler.next(response);
  }

  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((RegExpMatch match) => debugPrint(match.group(0)));
  }
}
