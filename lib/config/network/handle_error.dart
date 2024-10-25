import 'dart:async';
import 'dart:io';
import 'package:business_card_app/config/network/status_code.dart';
import 'package:dio/dio.dart';
import '../../core/response/api_response.dart';
import '../../core/type_def/type_def.dart';

FR handleDioError({required DioException err}) async {
  try {

    // Another way to check if there is no internet connection
    if (err.error is SocketException) {
      return ApiResponse(
        message: 'No Internet Connection',
        statusCode: err.response?.statusCode ?? ApiStatusCode.httpInternetConnection,
      );
    }

    // Check through DioExceptionType, if there is no internet connection
    if(err.type == DioExceptionType.connectionError){
      return ApiResponse(
        message: 'No Internet Connection',
        statusCode: err.response?.statusCode ?? ApiStatusCode.httpInternetConnection,
      );
    }

    // Check through DioExceptionType, if there is a connection timeout it means internet is available but the request is taking too long
    if(err.type == DioExceptionType.connectionTimeout){
      return ApiResponse(
        message: 'Connection Timeout',
        statusCode: err.response?.statusCode ?? ApiStatusCode.httpInternetConnection,
      );
    }

    // SendTimeout, its means the request is taking too long to send
    if(err.type == DioExceptionType.sendTimeout){
      return ApiResponse(
        message: 'Send Timeout',
        statusCode: err.response?.statusCode ?? ApiStatusCode.httpInternetConnection,
      );
    }

    // ReceiveTimeout, its means the request is taking too long to receive
    if(err.type == DioExceptionType.receiveTimeout){
      return ApiResponse(
        message: 'Receive Timeout',
        statusCode: err.response?.statusCode ?? ApiStatusCode.httpInternetConnection,
      );
    }


    // BadCertificate, its means the certificate is invalid
    if(err.type == DioExceptionType.badCertificate){
      return ApiResponse(
        message: 'Bad Certificate',
        statusCode: err.response?.statusCode ?? ApiStatusCode.httpInternetConnection,
      );
    }




    // Check if response is null
    if (err.response == null) {
      return ApiResponse(
        message: 'No Internet Connection',
        statusCode: 0,
      );
    }


    int errorCode = err.response?.statusCode ?? 500;

    switch (errorCode) {
      case ApiStatusCode.httpUnAuthorized:
        return ApiResponse(
          message: 'Unauthorized',
          authError: true,
          statusCode: errorCode,
        );

      case ApiStatusCode.httpForbidden:
        return ApiResponse(
          message: 'Forbidden',
          statusCode: errorCode,
        );

      case ApiStatusCode.httpBadRequest:
        return ApiResponse(
          message: 'Bad Request',
          statusCode: errorCode,
        );

      case ApiStatusCode.httpNotFound:
        return ApiResponse(
          message: 'Not Found',
          statusCode: errorCode,
        );

      case ApiStatusCode.httpInternalServerError:
        return ApiResponse(
          message: 'Internal Server Error',
          statusCode: errorCode,
        );

      case ApiStatusCode.httpServiceUnavailable:
        return ApiResponse(
          message: 'Service Unavailable',
          statusCode: errorCode,
        );

      case ApiStatusCode.httpGatewayTimeout:
        return ApiResponse(
          message: 'Gateway Timeout',
          statusCode: errorCode,
        );

      case ApiStatusCode.httpBadGateway:
        return ApiResponse(
          message: 'Bad Gateway',
          statusCode: errorCode,
        );

      default:
        return ApiResponse(
          message: 'Something went wrong',
          statusCode: errorCode,
        );
    }
  } catch (e) {
    return ApiResponse(
      message: 'Something went wrong',
      statusCode: 0,
    );
  }
}

FR handleHttpError({ required dynamic error }) async {

  if (error is SocketException) {
    return ApiResponse(
      message: 'No Internet Connection',
      statusCode: ApiStatusCode.httpInternetConnection,
    );
  }

  if (error is TimeoutException) {
    // Handle request timeout
    return ApiResponse(
      message: 'Request Timeout',
      statusCode: ApiStatusCode.httpInternetConnection,
    );
  }

  if (error is HttpException) {
    return ApiResponse(
      message: error.message,
      statusCode: ApiStatusCode.httpNotFound,
    );
  }

  // Handle other types of errors
  return ApiResponse(
    message: 'Something went wrong',
    statusCode: ApiStatusCode.httpInternalServerError,
  );
}

