class AppException implements Exception {
final _message;
final _prefix;

  AppException([this._message, this._prefix]);

  static String noInternetError = '';
  
  @override
  String toString() {
   String error = '$_prefix: $_message';
   noInternetError = _prefix == 'No internet' ? error : ''; 
    return error;
  }

}

class InternetException extends AppException {
 InternetException([String? message]) :super(message, 'No internet');

}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, 'Request time out');

}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Internal server error');

}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message, 'Invalid Url');

}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'FetchDataException');

}