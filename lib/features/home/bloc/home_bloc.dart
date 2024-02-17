import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:together_assignment/features/home/models/home_data_model.dart';
import 'package:together_assignment/features/home/repos/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    //Event handlers for specific event types
    on<HomeInitialFetchEvent>(homeInitialFetchEvent);
    on<LoadMoreHomeEvent>(loadMoreHomeEvent);
  }

  // Initialize page to 1 and create an empty list for data
  int page = 1;
  final List<HomeDataModel> _dataList = [];

  FutureOr<void> homeInitialFetchEvent(
      HomeInitialFetchEvent event, Emitter<HomeState> emit) async {
    page = 1;
    emit(HomeLoadingState());
    try {
      // Fetch data from repository
      List<HomeDataModel> datas = await HomeRepo.fetchHomeData(page);
      // Emit loaded success state with fetched data
      emit(HomeLoadedSuccessState(datas: datas));
    } catch (e) {
      // Emit error state if data fetching fails
      emit(HomeErrorState("Failed to fetch data. Please try again later."));
    }
  }

  FutureOr<void> loadMoreHomeEvent(
      LoadMoreHomeEvent event, Emitter<HomeState> emit) async {
    // Increment page for pagination
    page += 1;
    try {
      // Fetch more data from repository based on updated page
      List<HomeDataModel> datas = await HomeRepo.fetchHomeData(page);
      // Emit loaded success state with fetched data
      emit(HomeLoadedSuccessState(datas: datas));
    } catch (e) {
      // Emit error state if data fetching fails
      emit(HomeErrorState("Failed to fetch data. Please try again later."));
    }
  }
}
