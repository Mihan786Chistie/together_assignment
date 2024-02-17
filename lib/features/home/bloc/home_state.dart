part of 'home_bloc.dart';

@immutable
// Define an abstract class for HomeState, indicating it's immutable
abstract class HomeState {}

// Define an abstract subclass of HomeState for states representing actions
abstract class HomeActionState extends HomeState {}

// Define a concrete class for the initial state of the home BLoC
class HomeInitialState extends HomeState {}

// Define a concrete class for the state representing loading
class HomeLoadingState extends HomeState {}

// Define an event class for loading more home data
class LoadMoreHomeEvent extends HomeEvent {
  // Constructor for LoadMoreHomeEvent
  LoadMoreHomeEvent();
}

// Define a concrete class for the state representing successful data loading
class HomeLoadedSuccessState extends HomeState {
  // Define a list of home data models as a property
  final List<HomeDataModel> datas;

  // Constructor for HomeLoadedSuccessState
  HomeLoadedSuccessState({required this.datas});
}

// Define a concrete class for the state representing an error
class HomeErrorState extends HomeState {
  // Define an error message as a property
  final String errorMessage;

  // Constructor for HomeErrorState
  HomeErrorState(this.errorMessage);
}
