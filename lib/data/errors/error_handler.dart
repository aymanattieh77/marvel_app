import 'package:dio/dio.dart';
import 'failure.dart';

class ErrorHandler {
  static Failure fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ResponseStatusCode.connectTimeOut.getFailure();

      case DioErrorType.sendTimeout:
        return ResponseStatusCode.sendTimeOut.getFailure();
      case DioErrorType.receiveTimeout:
        return ResponseStatusCode.receiveTimeOut.getFailure();
      case DioErrorType.badCertificate:
        return Failure(
            dioError.response!.statusCode!, dioError.response!.statusMessage!);
      case DioErrorType.badResponse:
        return Failure(
            dioError.response!.statusCode!, dioError.response!.statusMessage!);
      case DioErrorType.cancel:
        return ResponseStatusCode.cancelError.getFailure();
      case DioErrorType.connectionError:
        return ResponseStatusCode.connectTimeOut.getFailure();
      case DioErrorType.unknown:
        return fromResponseError(dioError.response!.statusCode);
    }
  }

  static Failure fromResponseError(int? statusCode) {
    if (statusCode != null) {
      switch (statusCode) {
        case 400:
          return ResponseStatusCode.badRequest.getFailure();
        case 401:
          return ResponseStatusCode.unauthorized.getFailure();
        case 403:
          return ResponseStatusCode.forbidden.getFailure();
        case 404:
          return ResponseStatusCode.notFound.getFailure();
        default:
          return ResponseStatusCode.defaultError.getFailure();
      }
    } else {
      return ResponseStatusCode.defaultError.getFailure();
    }
  }
}

extension ResponseStatusCodeExtension on ResponseStatusCode {
  Failure getFailure() {
    switch (this) {
      case ResponseStatusCode.ok:
        return Failure(ResponsesCode.ok, ResponsesMessages.ok);
      case ResponseStatusCode.noContent:
        return Failure(ResponsesCode.noContent, ResponsesMessages.noContent);
      case ResponseStatusCode.badRequest:
        return Failure(ResponsesCode.badRequest, ResponsesMessages.badRequest);
      case ResponseStatusCode.unauthorized:
        return Failure(
            ResponsesCode.unauthorized, ResponsesMessages.unauthorized);
      case ResponseStatusCode.forbidden:
        return Failure(ResponsesCode.forbidden, ResponsesMessages.forbidden);
      case ResponseStatusCode.notFound:
        return Failure(ResponsesCode.notFound, ResponsesMessages.notFound);
      case ResponseStatusCode.noIntenetConnection:
        return Failure(ResponsesCode.noIntenetConnection,
            ResponsesMessages.noIntenetConnection);
      case ResponseStatusCode.defaultError:
        return Failure(
            ResponsesCode.defaultError, ResponsesMessages.defaultError);
      case ResponseStatusCode.cacheError:
        return Failure(ResponsesCode.cacheError, ResponsesMessages.cacheError);
      case ResponseStatusCode.connectTimeOut:
        return Failure(
            ResponsesCode.connectTimeOut, ResponsesMessages.connectTimeOut);
      case ResponseStatusCode.receiveTimeOut:
        return Failure(
            ResponsesCode.receiveTimeOut, ResponsesMessages.receiveTimeOut);
      case ResponseStatusCode.sendTimeOut:
        return Failure(
            ResponsesCode.sendTimeOut, ResponsesMessages.sendTimeOut);
      case ResponseStatusCode.cancelError:
        return Failure(
            ResponsesCode.cancelError, ResponsesMessages.cancelError);
    }
  }
}
