part of 'home_bloc.dart';

abstract class HomeState extends BaseResponse {}

class HomeInitialState extends HomeState {}

class HomeGetDataState extends HomeState {
  final Status status;
  final String? statusMessage;

  HomeGetDataState({required this.status, this.statusMessage});
}
