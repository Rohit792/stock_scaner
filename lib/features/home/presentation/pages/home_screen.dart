import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan_parser/core/network/base_response.dart';
import 'package:stock_scan_parser/features/detail/presentation/detail_screen.dart';
import 'package:stock_scan_parser/features/home/presentation/bloc/home_bloc.dart';
import 'package:stock_scan_parser/features/home/presentation/widgets/seperator.dart';
import 'package:stock_scan_parser/generated/l10n.dart';
import 'package:stock_scan_parser/injection_container.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homeScreen';

  HomeScreen({Key? key}) : super(key: key);
  late final HomeBloc _homeBloc = sl<HomeBloc>()..add(GetDataEvent());

  late double screenWidth;

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColorSchema = Theme.of(context).colorScheme;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: themeColorSchema.surface,
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: _homeBloc,
        listener: (context, state) {
          if (state is HomeGetDataState) {
            if (state.status == Status.loading) {
              _onLoading(context);
            } else if (state.status == Status.completed) {
            } else if (state.status == Status.error) {}
          }
        },
        builder: (context, state) {
          return ListView.builder(
              itemCount: _homeBloc.stockData.length,
              itemBuilder: ((context, index) {
                var stockElement = _homeBloc.stockData[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, DetailScreen.routeName,
                        arguments: stockElement);
                  },
                  child: Card(
                    color: themeColorSchema.surface,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 18, right: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stockElement["name"] ?? "--",
                            style: TextStyle(color: themeColorSchema.primary),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            stockElement["tag"],
                            style: TextStyle(
                                color: stockElement["color"]
                                        .toString()
                                        .contains("green")
                                    ? themeColorSchema.secondary
                                    : themeColorSchema.tertiary),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12, right: 18),
                            child: CustomPaint(
                              painter: LinePainter(
                                color: themeColorSchema.primary,
                                firstOffset: const Offset(1, 1),
                                secondOffset: Offset(screenWidth - 54, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }));
        },
      ),
    );
  }

  void _onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black12,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(S.current.Loading,
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor)),
              ),
            ],
          ),
        );
      },
    );
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog
    });
  }
}
