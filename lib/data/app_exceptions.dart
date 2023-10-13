import 'package:get/get.dart';

class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message])
      : super(message, 'internet_exception'.tr);
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message])
      : super(message, 'request_time_out_exception'.tr);
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, 'server_exception'.tr);
}

class InvalidUrlEception extends AppExceptions {
  InvalidUrlEception([String? message])
      : super(message, 'invalid_url_exception'.tr);
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, '');
}
