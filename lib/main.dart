import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together_assignment/features/home/bloc/home_bloc.dart';
import 'package:together_assignment/features/home/ui/home.dart';
import 'package:together_assignment/features/home/util/themes.dart';

void main() {
  // Initialize the HomeBloc
  final HomeBloc homeBloc = HomeBloc();
  // Run the application with the HomeBloc provided as a value using BlocProvider
  runApp(BlocProvider.value(value: homeBloc, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Together-Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.lightTheme,
      home: const Home(),
    );
  }
}
