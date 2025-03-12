import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

String getDioErrorMessage(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return "Connection timed out, Please try again";
    case DioExceptionType.connectionError:
      return "No internet connection";
    case DioExceptionType.badResponse:
      switch (exception.response?.statusCode) {
        case 403:
          return "API key has exceeded calls per month quota";
        default:
          return "Invalid request";
      }
    default:
      return "An error has occured";
  }
}

Widget addHorizontalSpace(double size) {
  return SizedBox(width: size);
}

Widget addVerticalSpace(double size) {
  return SizedBox(height: size);
}
