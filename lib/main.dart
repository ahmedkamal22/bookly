import 'package:bookly/core/utils/bloc_observer.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/hive_initialization.dart';
import 'package:bookly/core/utils/setup_singleton.dart';
import 'package:bookly/features/home/data/repositories/home_repository_impl.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/fetch_featured_books/cubit.dart';
import 'package:bookly/features/home/presentation/manager/fetch_newest_books/cubit.dart';
import 'package:bookly/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await hiveInitialization();
  setupSingleton();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchFeaturedBooksCubit(
              fetchFeaturedBooksUseCase: FetchFeaturedBooksUseCase(
            homeRepository: locator.get<HomeRepositoryImpl>(),
          ))
            ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => FetchNewestBooksCubit(
              fetchNewestBooksUseCase: FetchNewestBooksUseCase(
                  homeRepository: locator.get<HomeRepositoryImpl>()))
            ..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: kPrimaryColor,
            elevation: 0,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
