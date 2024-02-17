part of 'home_bloc.dart';

// Define an abstract class representing the base HomeEvent
@immutable
abstract class HomeEvent {}

// Define a concrete class representing the HomeInitialFetchEvent,
// which extends the abstract HomeEvent class
class HomeInitialFetchEvent extends HomeEvent {
  // Constructor for the HomeInitialFetchEvent
  HomeInitialFetchEvent();
}
