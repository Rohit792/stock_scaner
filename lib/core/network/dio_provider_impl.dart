import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:stock_scan_parser/core/network/api_manger.dart';
import 'package:stock_scan_parser/core/network/app_exceptions.dart';
import 'package:stock_scan_parser/core/network/base_response.dart';
import 'package:stock_scan_parser/core/network/dio_error_handler.dart';
import 'package:stock_scan_parser/env/flavour_config.dart';

class DioProviderImpl implements ApiManager {
  static final String baseUrl = FlavorConfig.instance.values.baseUrl;

  static Dio dioClient = _addInterceptors(_createDio());

  static Dio _createDio() {
    BaseOptions opts = BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );
    return Dio(opts);
  }

  static Dio _addInterceptors(Dio dio) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: false,
        compact: true,
        request: true,
        error: true,
        maxWidth: 120,
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      return handler.next(response); // continue
    }, onError: (DioError error, handler) async {
      var e = DioErrorHandler.dioErrorToString(error);
      debugPrint(e);
      return handler.next(error);
    }));

    return dio;
  }

  @override
  Future<List<dynamic>> get(String url,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dioClient.get(url, queryParameters: queryParams);
      return response.data;
    } on DioError catch (e) {
      debugPrint('dio error $e');
      if (e.response != null && e.response!.data != null) {
        throw ServerException();
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<BaseResponse> post(String url,
      {Map<String, dynamic>? headers, body, encoding}) async {
    try {
      final response = await dioClient.post(url, data: body);

      return BaseResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != null) {
        throw ServerException();
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<BaseResponse> delete(String url,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response =
          await dioClient.delete(url, queryParameters: queryParams);
      return BaseResponse.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint('dio error $e');
      if (e.response != null && e.response!.data != null) {
        throw ServerException();
      } else {
        throw ServerException();
      }
    }
  }
}
