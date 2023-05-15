import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum ExceptionType {
  badRequest,
  internalServer,
  conflict,
  unauthorized,
  forbidden,
  notFound,
  noInternetConnection,
  deadlineExceeded,
  unknown
}

class RestException extends DioError {
  RestException(
      {required RequestOptions request,
      DioError? error,
      this.status,
      this.responseMessage = 'Something went wrong',
      this.exceptionType = ExceptionType.unknown})
      : super(
            requestOptions: request,
            error: error,
            response: error?.response,
            type: error?.type ?? DioErrorType.other);

  final String? status;
  final String responseMessage;
  final ExceptionType exceptionType;

  static ExceptionType getExceptionType(int? statusCode) {
    switch (statusCode) {
      case 400:
        return ExceptionType.badRequest;
      case 401:
        return ExceptionType.unauthorized;
      case 403:
        // Valid credentials but no privilege to perform the action
        return ExceptionType.forbidden;
      case 404:
        return ExceptionType.notFound;
      case 409:
        return ExceptionType.conflict;
      case 500:
        return ExceptionType.internalServer;
      default:
        return ExceptionType.unknown;
    }
  }

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': responseMessage};

  factory RestException.fromResponse(Response response, {DioError? error}) {
    try {
      final responseMessage = response.data['message'] ?? '';
      return RestException(
          request: response.requestOptions,
          error: error,
          status: response.statusCode.toString(),
          responseMessage: responseMessage,
          exceptionType: getExceptionType(response.statusCode));
    } catch (error) {
      return RestException(
          request: response.requestOptions,
          status: response.statusCode.toString(),
          responseMessage: 'Unknown Error');
    }
  }

  @override
  String toString() {
    return 'RestException: ${toJson().toString()}';
  }
}
