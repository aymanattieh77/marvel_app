import 'package:dio/dio.dart';
import 'failure.dart';

class ServerFailure extends Failure {
  ServerFailure(super.statusCode, super.message);

  factory ServerFailure.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure(1, 'Connection timeout with ApiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure(1, 'Send timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure(1, 'Receive timeout with ApiServer');
      case DioErrorType.badCertificate:

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            error.response!.statusCode, error.response!.data);
      case DioErrorType.cancel:
        return ServerFailure(1, 'Request to ApiServer was canceld');
      case DioErrorType.connectionError:
        return ServerFailure.fromResponse(
            error.response!.statusCode, error.response!.data);
      case DioErrorType.unknown:
        if (error.message!.contains('SocketException')) {
          return ServerFailure(1, 'No Internet Connection');
        }
        return ServerFailure(1, 'Unexpected Error, Please try again!');
      default:
        return ServerFailure(1, 'Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(statusCode ?? 1, response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(404, 'Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure(500, 'Internal Server error, Please try later');
    } else {
      return ServerFailure(
          statusCode ?? 1, 'Opps There was an Error, Please try again');
    }
  }
}
