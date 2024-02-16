part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialFetchEvent extends HomeEvent {
  HomeInitialFetchEvent();
}

class LoadMoreHomeEvent extends HomeEvent {
  LoadMoreHomeEvent();
}
