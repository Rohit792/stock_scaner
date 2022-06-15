import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioErrorHandler {
  static String? dioErrorToString(DioError dioError) {
    String? errorText;
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        errorText = "Connection lost, please check your internet connection and try again.";
        break;
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        errorText = "Connection lost, please check your internet connection and try again.";
        break;
      case DioErrorType.response:
        errorText = _errorBaseOnHttpStatusCode(dioError);
        break;
      case DioErrorType.other:
        errorText = "Connection lost, please check your internet connection and try again.";
        break;
      case DioErrorType.cancel:
        errorText = "Connection lost, please check your internet connection and try again.";
        break;
    }
    return errorText;
  }

  static String _errorBaseOnHttpStatusCode(DioError dioError) {
    String errorText;
    if (dioError.response != null) {
      if (dioError.response!.statusCode == 401) {
        errorText = "Something went wrong, please close the app and login again.";
      } else if (dioError.response!.statusCode == 404) {
        errorText = "Connection lost, please check your internet connection and try again.";
      } else if (dioError.response!.statusCode == 500) {
        errorText = "We couldn't connect to the product server";
      } else {
        errorText = "Something went wrong, please close the app and login again.";
      }
    } else {
      errorText = "Something went wrong, please close the app and login again.";
    }

    return errorText;
  }
}

updateErrorToUI(String? errorMsg) {
  if (errorMsg?.isNotEmpty ?? false) {
    //toast(errorMsg ?? '');
    //showSimpleNotification(Text(errorMsg ?? ''), background: Colors.red);
  }
}

printErrorToConsole(Object? e) {
  if (e != null) {
    debugPrint(e.toString());
  }
}
