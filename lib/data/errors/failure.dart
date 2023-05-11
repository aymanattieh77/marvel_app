import 'package:marvel_app/app/res/strings.dart';

class Failure {
  String message;
  int statusCode;
  Failure(this.statusCode, this.message);
}

enum ResponseStatusCode {
  ok,
  noContent,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  noIntenetConnection,
  defaultError,
  cacheError,
  connectTimeOut,
  receiveTimeOut,
  sendTimeOut,
  cancelError
}

abstract class ResponsesCode {
  static const int ok = 200; // success with data
  static const int noContent = 201; // success without  data (no content)
  static const int badRequest = 400; // failure, API rejected requset
  static const int unauthorized = 401; // failure, user is not authroized
  static const int forbidden = 403; // failure, API rejected requset
  static const int notFound = 404; // failure, not found

  // local status code
  static const int connectTimeOut = -1;
  static const int cancelError = -2;
  static const int receiveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int cacheError = -5;
  static const int noIntenetConnection = -6;
  static const int defaultError = -7;
}

abstract class ResponsesMessages {
  static const String ok = AppStrings.statusOk;
  static const String noContent = AppStrings.noContent;
  static const String badRequest = AppStrings.badRequestError;
  static const String unauthorized = AppStrings.unauthorizedError;
  static const String forbidden = AppStrings.forbiddenError;
  static const String notFound = AppStrings.notfound;

  // local status code messages
  static const String connectTimeOut = AppStrings.connectTimeOut;
  static const String cancelError = AppStrings.cancelError;
  static const String receiveTimeOut = AppStrings.receiveTimeOut;
  static const String sendTimeOut = AppStrings.sendTimeOut;
  static const String cacheError = AppStrings.cacheError;
  static const String noIntenetConnection = AppStrings.noInternetConnection;
  static const String defaultError = AppStrings.defaultError;
}
