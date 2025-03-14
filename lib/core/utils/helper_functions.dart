import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:umbrella/core/constants/app_colors.dart';

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
        case 400:
          return "No location found";
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

SnackBar buildSanckBar({
  required String message,
  bool isError = false,
}) {
  return SnackBar(
    content: Text(
      message,
      style: TextStyle(color: AppColors.secondary),
    ),
    backgroundColor: isError ? Colors.redAccent : AppColors.accent,
    behavior: SnackBarBehavior.floating,
  );
}
