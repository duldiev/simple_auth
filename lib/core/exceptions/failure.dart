// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'network_exceptions.dart';

abstract class Failure {
  NetworkExceptions get exception;
}

class ErrorMessageException implements Failure {
  Response? response;
  ErrorMessageException(this.response);

  @override
  NetworkExceptions get exception => NetworkExceptions(
        statusCode: response?.statusCode,
        response: response,
        message: response?.data['message'] as String?,
      );
}

class ServerFailure extends Failure {
  Response? response;
  ServerFailure({this.response});

  @override
  NetworkExceptions get exception => NetworkExceptions(
        statusCode: response?.statusCode,
        response: response,
        message: response?.data['message'] as String?,
      );
}

class CacheFailure extends Failure {
  Response? response;
  @override
  NetworkExceptions get exception => NetworkExceptions(
        statusCode: response?.statusCode,
        response: response,
        message: response?.data['message'] as String?,
      );
}

class DioFailure extends Failure {
  Response? response;

  DioFailure({this.response});

  @override
  NetworkExceptions get exception => NetworkExceptions(
        statusCode: response?.statusCode,
        response: response,
        message: response?.data['message'] as String?,
      );
}

class DioConnectionError extends DioError {
  DioConnectionError({
    required RequestOptions requestOptions,
    Response? response,
    DioErrorType type = DioErrorType.unknown,
    dynamic error,
  }) : super(
          requestOptions: requestOptions,
          response: response,
          type: type,
          error: error,
        );
}

class NoConnectionFailure extends Failure {
  @override
  NetworkExceptions get exception => NetworkExceptions(
        statusCode: -3,
      );
}

class ServerException implements Exception {
  Response? response;
  ServerException({this.response});
}
