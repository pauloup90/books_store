import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app_router.dart';
import 'core/colors.dart';
import 'manger/fetch_Books_cubit1/sports cubit/sports.dart';
import 'manger/fetch_Books_cubit2/ditels_cubit.dart';
import 'manger/fetch_Books_cubit2/programing_books_cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ProgramingBooksCubit()..fetchFutureBooks()),

          BlocProvider(
              create: (context) => SportsBooksCubit()..fetchFutureBooks2()),
          BlocProvider(create: (context) => DitelsCubit()..bookDetailsCubit()),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark()
              .copyWith(scaffoldBackgroundColor: CustemColors.bg),
        ));
  }
}
