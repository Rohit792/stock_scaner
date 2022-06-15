import 'package:stock_scan_parser/core/network/api_manger.dart';
import 'package:stock_scan_parser/core/network/endpoints.dart';
import 'package:stock_scan_parser/features/home/domain/home_repository_builder.dart';
import 'package:stock_scan_parser/injection_container.dart';
import 'package:stock_scan_parser/utils/extensions.dart';

import '../../../core/network/dio_error_handler.dart';

class HomeRepositoryImp extends HomeRepository {
  late ApiManager apiManager = sl<ApiManager>();
  @override
  Future<dynamic> getStockData() async {
    try {
      var response = await apiManager.get(ApiEndpoints.data);
      if (response.isNotEmpty) {
        return response;
      } else {
        updateErrorToUI("some_thing_went_wrong".localizedString);
        return response;
      }
    } catch (e) {
      printErrorToConsole(e);
    }
    return null;
  }
}
