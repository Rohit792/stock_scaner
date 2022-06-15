import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan_parser/core/app_localizations.dart';
import 'package:stock_scan_parser/core/network/base_response.dart';
import 'package:stock_scan_parser/features/home/domain/home_repository_builder.dart';
import 'package:stock_scan_parser/utils/extensions.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeInitialState()) {
    on<GetDataEvent>(getStockData);
  }

  List<dynamic> stockData = [];

  Future getStockData(GetDataEvent event, Emitter<HomeState> emit) async {
    print("object");
    try {
      emit(HomeGetDataState(
          status: Status.loading, statusMessage: 'please_wait'));
      final res = await homeRepository.getStockData();

      if (res != null) {
        stockData = res;
        emit(HomeGetDataState(
            status: Status.completed,
            statusMessage: 'data_loaded_successfully'));
      } else {
        emit(HomeGetDataState(
            status: Status.error, statusMessage: 'something_went_wrong'));
      }
    } catch (e) {
      print(e);
    }
  }
}
