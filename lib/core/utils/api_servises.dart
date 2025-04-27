import 'package:dio/dio.dart';

class ApiServises {
  final Dio _dio;
  final _basiUrl = "https://www.googleapis.com/books/v1/";
  ApiServises(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get("$_basiUrl$endPoint");
    return response.data;
  }
}
