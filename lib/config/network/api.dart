import 'package:dio/dio.dart';

import 'handle_error.dart';

class Api{
  static final Api _api = Api._internal();
  late Dio _dio;

  factory Api(){
    return _api;
  }

  Api._internal(){
    _dio = Dio();
  }

  Future<Response> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } on DioException catch (e) {
      var error = await handleDioError(err: e);
      Response response = Response(
        requestOptions: RequestOptions(path: url),
        data: error,
        statusCode: error.statusCode,
        statusMessage: error.message,
      );
      return response;
    }
    catch (e) {
      var error = await handleHttpError(error: e);
      Response response = Response(
        requestOptions: RequestOptions(path: url),
        data: error,
        statusCode: error.statusCode,
        statusMessage: error.message,
      );
      return response;
    }

  }

  Future<Response> post(String url, dynamic data) async {
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } on DioException catch (e) {
      print("POST - DIO EXCEPTION: $e");
      var error = await handleDioError(err: e);
      Response response = Response(
        requestOptions: RequestOptions(path: url),
        data: error,
        statusCode: error.statusCode,
        statusMessage: error.message,
      );
      return response;
    }
    catch (e) {
      var error = await handleHttpError(error: e);
      Response response = Response(
        requestOptions: RequestOptions(path: url),
        data: error,
        statusCode: error.statusCode,
        statusMessage: error.message,
      );
      return response;
    }
  }
}