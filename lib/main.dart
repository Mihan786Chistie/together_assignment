import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together_assignment/features/home/bloc/home_bloc.dart';
import 'package:together_assignment/features/home/ui/home.dart';
import 'package:together_assignment/features/home/util/themes.dart';

void main() {
  final HomeBloc homeBloc = HomeBloc();
  runApp(BlocProvider.value(value: homeBloc, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
