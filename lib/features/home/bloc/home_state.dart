part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class LoadMoreHomeEvent extends HomeEvent {
  LoadMoreHomeEvent();
}

class HomeLoadedSuccessState extends HomeState {
  final List<HomeDataModel> datas;

  HomeLoadedSuccessState({required this.datas});
}

class HomeErrorState extends HomeState {
  final String errorMessage;
  HomeErrorState(this.errorMessage);
}
