import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkException implements Exception {
  final String? prefix;
  final Response? response;

  NetworkException({
    this.prefix, 
    this.response,
  });

  @override
  String toString() {
    var result = '';
    if(response?.statusCode == 400 || response?.data == 401 || response?.statusCode == 409) {
      var message = jsonDecode(jsonEncode(response?.data))?['message'];
      if(message != null) {
        result += message ?? '';
      } else {
        result += prefix ?? '';
      }
    } else {
      result += prefix ?? '';
    }
    return result;
  }

  static NetworkException handleResponse(Response response) {
    var statusCode = response.statusCode!;
    switch (statusCode) {
      case 400:
        return BadRequestException(response: response);
      case 401:
        return UnauthorisedException(response: response);
      case 403:
        return BadRequestException(response: response);
      case 404:
        return NotFoundException(response: response);
      case 409:
        return FetchDataException(response: response);
      case 408:
        return SendTimeOutException();
      case 413:
        return RequestEntityTooLargeException(response: response);
      case 422:
        return BadRequestException(response: response);
      case 500:
        return InternalServerErrorException();
      case 503:
        return InternalServerErrorException();
      default:
        var responseCode = statusCode;
        return FetchDataException(
          message: 'Received invalid status code: $responseCode',
          response: response,
        );
    }
  }

  static NetworkException getErrorException(error) {
    if (error is Exception) {
      debugPrint('NetworkException: 1');
      try {
        NetworkException networkExceptions;
        debugPrint('NetworkException: 2');
        if (error is DioError) {
          debugPrint('NetworkException: 3');
          switch (error.type) {
            case DioErrorType.cancel:
              debugPrint('NetworkException: 4');
              networkExceptions = RequestCancelled();
              break;
            case DioErrorType.connectTimeout:
              debugPrint('NetworkException: 5');
              networkExceptions = ConnectionTimeOutException();
              break;
            case DioErrorType.other:
              debugPrint('NetworkException: 6');
              networkExceptions = FetchDataException();
              break;
            case DioErrorType.receiveTimeout:
              debugPrint('NetworkException: 7');
              networkExceptions = ReceiveTimeOutException();
              break;
            case DioErrorType.response:
              debugPrint('NetworkException: 8');
              networkExceptions = NetworkException.handleResponse(error.response!);
              break;
            case DioErrorType.sendTimeout:
              debugPrint('NetworkException: 9');
              networkExceptions = SendTimeOutException();
              break;
          }
        } else if (error is SocketException) {
          debugPrint('NetworkException: 10');
          networkExceptions = FetchDataException();
        } else {
          debugPrint('NetworkException: 11');
          networkExceptions = FetchDataException();
        }
        debugPrint('NetworkException: 12');
        return networkExceptions;
      } on FormatException catch (_) {
        return FetchDataException();
      } catch (_) {
        return FetchDataException();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return FetchDataException();
      } else {
        return FetchDataException();
      }
    }
  }
}

class ConnectionTimeOutException extends NetworkException {
  ConnectionTimeOutException() : super(prefix: 'Connection Timeout');
}

class ReceiveTimeOutException extends NetworkException {
  ReceiveTimeOutException() : super(prefix: 'Receive Timeout');
}

class SendTimeOutException extends NetworkException {
  SendTimeOutException() : super(prefix: 'Send Timeout');
}

class InternalServerErrorException extends NetworkException {
  InternalServerErrorException() : super(prefix: 'Internal Server Error');
}

class RequestEntityTooLargeException extends NetworkException {
  RequestEntityTooLargeException({String? message, Response? response}) : super(
    prefix: 'Request Entity Too Large',
    response: response,
  );
}

class FetchDataException extends NetworkException {
  FetchDataException({String? message, Response? response}) : super(
    prefix: 'Error During Communication',
    response: response,
  );
}

class NotFoundException extends NetworkException {
  NotFoundException({String? message, Response? response}) : super(
    prefix: 'Not Found',
    response: response,
  );
}

class BadRequestException extends NetworkException {
  BadRequestException({String? message, Response? response}) : super(
    prefix: 'Invalid Request',
    response: response,
  );
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException({String? message, Response? response}) : super(
    prefix: 'Unauthorised',
    response: response,
  );
}

class InvalidInputException extends NetworkException {
  InvalidInputException({String? message, Response? response}) : super(
    prefix: 'Invalid Input',
    response: response,
  );
}

class RequestCancelled extends NetworkException {
  RequestCancelled({String? message, Response? response}) : super(
    prefix: 'Request Cancelled',
    response: response,
  );
}