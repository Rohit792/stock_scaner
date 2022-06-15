part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashInProgress extends SplashState {}

class SplashSuccess extends SplashState {
  final bool isLoggedIn;

  SplashSuccess({required this.isLoggedIn});
}
