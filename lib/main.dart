import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/view_model/now_playing/now_playing_cubit.dart';
import 'package:movies_app/view_model/popular/popular_cubit.dart';
import 'package:movies_app/view_model/search/search_cubit.dart';
import 'package:movies_app/view_model/top_rated/top_rated_cubit.dart';
import 'package:movies_app/view_model/trending/trending_cubit.dart';
import 'package:movies_app/view_model/upcoming/upcoming_cubit.dart';
import 'package:movies_app/views/screens/home_screen.dart';
import 'package:movies_app/views/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TrendingCubit>(create: (context) => TrendingCubit()),
        BlocProvider<TopRatedCubit>(create: (context) => TopRatedCubit()),
        BlocProvider<PopularCubit>(create: (context) => PopularCubit()),
        BlocProvider<UpcomingCubit>(create: (context) => UpcomingCubit()),
        BlocProvider<NowPlayingCubit>(create: (context) => NowPlayingCubit()),
        BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
      ],
      child: MaterialApp(
        routes: {
          '/search': (context) => const SearchScreen(),
          '/home': (context) => const HomeScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Movies App',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          scaffoldBackgroundColor: AppColors.primaryColor,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
            bodyLarge: TextStyle(color: Colors.white),
            titleLarge: TextStyle(color: Colors.white),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
