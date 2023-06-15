import 'package:dio/dio.dart';

abstract class Failure {
  final String errMassage;

  Failure(this.errMassage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMassage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection Timeout with ApiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServer');
      case DioErrorType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure(' ApiServer was canceld');

      case DioErrorType.connectionError:
        return ServerFailure('ConnectionError');
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('No Internet ,please try later!');
      default:
        return ServerFailure('OoOps There Was an Error, Please try again');
    }
    return ServerFailure('Unexpected Error , try again');
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Method not found, try Later ^_^');
    } else if (statusCode == 500) {
      return ServerFailure('Internal not found, try Later  ^_^');
    } else {
      return ServerFailure('OoOps There Was an Error, Please try again');
    }
  }
}
