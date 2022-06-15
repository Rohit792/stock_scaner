import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stock_scan_parser/features/splash/application/cubit/splash_cubit.dart';
import 'package:stock_scan_parser/injection_container.dart';
import 'package:stock_scan_parser/utils/assets.dart';

import '../../../home/presentation/pages/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';
  SplashScreen({Key? key}) : super(key: key);
  late final SplashCubit _authBloc = sl<SplashCubit>()..checkLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        bloc: _authBloc,
        listener: (context, state) {
          if (state is SplashSuccess) {
            if (state.isLoggedIn) {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            }
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                Assets.splashScreenBg,
                fit: BoxFit.fitWidth,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
