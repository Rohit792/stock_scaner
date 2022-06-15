import 'package:stock_scan_parser/core/network/base_response.dart';
import 'package:stock_scan_parser/features/home/data/home_repository_imp.dart';

class HomeRepositoryBuilder {
  static HomeRepository repository() => HomeRepositoryImp();
}

abstract class HomeRepository {
  Future<dynamic> getStockData();
}
