import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  Failures(this.errorMessage);
}

class ServerFailures extends Failures {
  ServerFailures(super.errorMessage);

  factory ServerFailures.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailures('Connection timeout with API server');

      case DioExceptionType.sendTimeout:
        return ServerFailures('Send timeout with API server');

      case DioExceptionType.receiveTimeout:
        return ServerFailures('Receive timeout with API server');

      case DioExceptionType.badCertificate:
        return ServerFailures('Bad certificate from API server');

      case DioExceptionType.badResponse:
        if (dioError.response != null) {
          return ServerFailures.fromResponse(
              dioError.response!.statusCode!, dioError.response!.data);
        } else {
          return ServerFailures('Received an invalid response from the server');
        }

      case DioExceptionType.cancel:
        return ServerFailures('Request to API server was canceled');

      case DioExceptionType.connectionError:
        return ServerFailures('No internet connection');

      case DioExceptionType.unknown:
      default:
        return ServerFailures('Oops! There was an error, please try again');
    }
  }

  factory ServerFailures.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailures(response["error"]["message"] ?? "Unauthorized request");
    } else if (statusCode == 404) {
      return ServerFailures("Your request was not found, please try later!");
    } else if (statusCode == 500) {
      return ServerFailures("Internal server error, please try later!");
    }
    return ServerFailures("Oops! There was an error, please try later!");
  }
}

