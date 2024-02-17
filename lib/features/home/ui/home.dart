import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:together_assignment/features/home/models/home_data_model.dart';
import 'package:together_assignment/features/home/ui/widgets/dataCard.dart';
import 'package:together_assignment/features/home/util/size.dart';

import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();
  final ScrollController _scrollController = ScrollController();
  final List<HomeDataModel> _dataList = [];
  bool isLoading = false;
  bool isEndOfList = false;

  @override
  void initState() {
    _fetchData();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    homeBloc.close();
    super.dispose();
  }

  void _fetchData() {
    homeBloc.add(HomeInitialFetchEvent());
    setState(() {
      _dataList.clear();
    });
  }

  void _onScroll() {
    if (_isScrollAtEnd()) {
      homeBloc.add(LoadMoreHomeEvent());
    }
  }

  bool _isScrollAtEnd() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Together-Assignment",
            style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.bold, fontSize: appBarSize),
          ),
        ),
        backgroundColor: Colors.redAccent,
        elevation: 1.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(listPadding),
        child: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          listenWhen: (previous, current) => current is HomeActionState,
          buildWhen: (previous, current) => current is! HomeActionState,
          listener: (context, state) {
            if (state is HomeErrorState) {
              // Handle error, show snackbar or error page
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage),
                width: errorMsgSize,
              ));
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case HomeLoadingState:
                isLoading = true;
                return const Center(
                  child: CircularProgressIndicator(color: Colors.redAccent),
                );
              case HomeLoadedSuccessState:
                final successState = state as HomeLoadedSuccessState;
                _dataList.addAll(successState.datas);
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: _dataList.length + (isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < _dataList.length) {
                      return DataCard(
                        datas: _dataList,
                        index: index,
                      );
                    } else {
                      Future.delayed(const Duration(milliseconds: 30), () {
                        _scrollController
                            .jumpTo(_scrollController.position.maxScrollExtent);
                      });
                      return const LinearProgressIndicator(
                        color: Colors.redAccent,
                      );
                    }
                  },
                );
              default:
                return Center(
                  child: Text(
                    "There is an Error Loading",
                    style: GoogleFonts.plusJakartaSans(color: Colors.redAccent),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
