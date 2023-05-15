import 'dart:async';
import 'package:bigpay_assessment/base/interceptors/custom_dio_errors.dart';
import 'package:dio/dio.dart';

class AppInterceptors extends QueuedInterceptor {
  AppInterceptors({
    required this.dio,
    // required AuthRepository authTokenStorage,
  });
  // : _authTokenStorage = authTokenStorage;
  final Dio dio;
  // final AuthRepository _authTokenStorage;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      // final accessToken = await _authTokenStorage.getToken();

      // if (accessToken != null) {
      //   options.headers['Authorization'] = accessToken;
      // }

      return handler.next(options);
    } catch (e) {
      return handler.next(options);
    }
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return handler.next(
          RestException(
            request: err.requestOptions,
            error: err,
            responseMessage: 'The connection has timed out, please try again.',
            exceptionType: ExceptionType.deadlineExceeded,
          ),
        );
      case DioErrorType.response:
        return handler.next(
          RestException(
            request: err.requestOptions,
            error: err,
            responseMessage: 'Unknown Error...',
            exceptionType: ExceptionType.deadlineExceeded,
          ),
        );
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        return handler.next(RestException(
          request: err.requestOptions,
          error: err,
          responseMessage: 'No internet connection detected, please try again.',
          exceptionType: ExceptionType.noInternetConnection,
        ));
    }

    return handler.next(err);
  }
}
