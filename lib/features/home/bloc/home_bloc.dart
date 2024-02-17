import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:together_assignment/features/home/models/home_data_model.dart';
import 'package:together_assignment/features/home/repos/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialFetchEvent>(homeInitialFetchEvent);
    on<LoadMoreHomeEvent>(loadMoreHomeEvent);
  }

  int page = 1;

  FutureOr<void> homeInitialFetchEvent(
      HomeInitialFetchEvent event, Emitter<HomeState> emit) async {
    page = 1;
    emit(HomeLoadingState());
    try {
      List<HomeDataModel> datas = await HomeRepo.fetchHomeData(page);
      emit(HomeLoadedSuccessState(datas: datas));
    } catch (e) {
      emit(HomeErrorState("Failed to fetch data. Please try again later."));
    }
  }

  FutureOr<void> loadMoreHomeEvent(
      LoadMoreHomeEvent event, Emitter<HomeState> emit) {}
}
