part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedSuccessState extends HomeState {
  final List<HomeDataModel> datas;

  HomeLoadedSuccessState({required this.datas});
}

final class HomeErrorState extends HomeState {
  final String errorMessage;
  HomeErrorState(this.errorMessage);
}
