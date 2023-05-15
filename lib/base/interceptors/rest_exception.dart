import 'dart:convert';

import 'package:http/http.dart';

class RestHttpException implements Exception {
  const RestHttpException({this.status, this.message});

  final String? status;
  final String? message;

  Map<String, dynamic> toJson() => {'status': status, 'message': message};

  factory RestHttpException.fromResponse(Response response) =>
      RestHttpException(
          status: response.statusCode.toString(),
          message: jsonDecode(response.body)['message']);

  @override
  String toString() {
    return 'RestException: ${toJson().toString()}';
  }
}
