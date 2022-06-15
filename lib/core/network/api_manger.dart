import 'package:stock_scan_parser/core/network/base_response.dart';

abstract class ApiManager {
  Future<dynamic> get(String url, {Map<String, dynamic>? queryParams});
  Future<BaseResponse> post(String url,
      {Map<String, dynamic>? headers, body, encoding});
  Future<BaseResponse> delete(String url, {Map<String, dynamic>? queryParams});
}
