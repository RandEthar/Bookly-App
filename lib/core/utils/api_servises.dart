import 'package:dio/dio.dart';

class ApiServises {

 final _basiUrl="https://www.googleapis.com/books/v1/";

 final Dio _dio;
ApiServises(this._dio);


 Future<Map<String,dynamic>> get({required String endPoint})async{
   var response=   await _dio.get('$_basiUrl$endPoint');
   return response.data;





 }








}