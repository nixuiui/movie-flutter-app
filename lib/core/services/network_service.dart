import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_log/dio_log.dart';
import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';

import '../const/app_consts.dart';
import '../error/network_failures.dart';
import '../network/logging_interceptor.dart';
import '../network/network_exceptions.dart';

class NetworkService {
  static NetworkService get to => Get.find();

  static const int requestTimeOut = 30 * 1000;

  late Dio dio;
  bool isProduction = true;

  NetworkService() {
    dio = Dio(_baseOptions);
    if (kDebugMode) {
      dio.interceptors.add(LoggingInterceptor());
      dio.interceptors.add(DioLogInterceptor());
    }
  }

  final _baseOptions = BaseOptions(
    baseUrl: AppConsts.host,
    connectTimeout: requestTimeOut,
    receiveTimeout: requestTimeOut,
    responseType: ResponseType.json,
    followRedirects: true,
  );

  Map<String, dynamic> headersRequest() {
    return {
      'Content-Type': 'application/json',
      'Authorization': "Bearer ${AppConsts.tokenAccess}",
      'Accept': 'application/json',
      'xtra-auth': '\$2a\$08\$rZKPiLAQQTjn7z7EbKryLeoKNxAM4vW6tRSzqGbbpSAqaTzr71g8O',
    };
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? parameters,
    Function(int, int)? onReceiveProgress,
    ResponseType? responseType
  }) async {
    return await _safeFetch(
      () => dio.get(
        url,
        queryParameters: parameters ?? {},
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: headersRequest(),
          responseType: responseType,
        ),
      ),
    );
  }

  Future<Response> post({
    required String url,
    dynamic data,
    Function(int, int)? onReceiveProgress,
    Function(int, int)? onSendProgress,
    ResponseType? responseType,
    Map<String, dynamic>? queryParameters,
    Map<String, Object>? parameters,
  }) async {
    return await _safeFetch(() => dio.post(
      url,
      data: jsonEncode(data),
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
      options: Options(
        responseType: responseType,
        headers: headersRequest(),
        contentType: 'application/json'
      ),
      queryParameters: queryParameters
    ));
  }

  Future<Response> put({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _safeFetch(() => dio.put(
      url,
      data: data,
      options: Options(headers: headersRequest()),
      queryParameters: queryParameters,
    ));
  }

  Future<Response> patch({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _safeFetch(() => dio.patch(
      url,
      data: data,
      options: Options(headers: headersRequest()),
      queryParameters: queryParameters,
    ));
  }

  Future<Response> delete({
    required String url,
    dynamic data,
    required Map<String, dynamic> parameters,
  }) async {
    return await _safeFetch(() => dio.delete(
      url,
      data: data,
      queryParameters: parameters,
      options: Options(
        headers: headersRequest(),
      ),
    ));
  }

  Future<Response> _safeFetch(Future<Response> Function() tryFetch) async {
    try {
      debugPrint('_safeFetch: _safeFetch');
      final response = await tryFetch();
      debugPrint('_safeFetch: $response');
      debugPrint('_safeFetch: ${response.realUri}');
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } on DioError catch (dioError) {
      if (dioError.response?.statusCode == 400 && dioError.requestOptions.path == '/user-delete-validate/') {
        var options = dioError.requestOptions;
        options.receiveDataWhenStatusError = true;
        options.data = dioError.response?.data;
        var response = Response(
          requestOptions: dioError.requestOptions,
          statusCode: dioError.response?.statusCode,
          data: dioError.response?.data,
        );
        return response;
      } else {
        switch (dioError.type) {
          case DioErrorType.connectTimeout:
            throw ConnectionTimeOutException();
          case DioErrorType.sendTimeout:
            throw SendTimeOutException();
          case DioErrorType.receiveTimeout:
            throw ReceiveTimeOutException();
          case DioErrorType.other:
            throw NetworkFailureError.noInternetConnection();
          case DioErrorType.response:
            throw NetworkException.handleResponse(dioError.response!);
          default:
            throw NetworkException.handleResponse(dioError.response!);
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
