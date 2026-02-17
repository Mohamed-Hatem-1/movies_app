import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/view_model/now_playing/now_playing_cubit.dart';
import 'package:movies_app/view_model/now_playing/now_playing_state.dart';
import 'package:movies_app/view_model/popular/popular_cubit.dart';
import 'package:movies_app/view_model/popular/popular_state.dart';
import 'package:movies_app/view_model/top_rated/top_rated_cubit.dart';
import 'package:movies_app/view_model/top_rated/top_rated_state.dart';
import 'package:movies_app/view_model/trending/trending_cubit.dart';
import 'package:movies_app/view_model/trending/trending_state.dart';
import 'package:movies_app/view_model/upcoming/upcoming_cubit.dart';
import 'package:movies_app/view_model/upcoming/upcoming_state.dart';
import 'package:movies_app/views/widgets/movie_gridview.dart';
import 'package:movies_app/views/widgets/my_bottom_navigationbar.dart';
import 'package:movies_app/views/widgets/search_textformfield.dart';
import 'package:movies_app/views/widgets/trending_movies_carousal_slider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TrendingCubit>().fetchHomeCarousalSliderMovies();
    context.read<TopRatedCubit>().getTopRatedMovies();
    context.read<PopularCubit>().getPopularMovies();
    context.read<UpcomingCubit>().getUpcomingMovies();
    context.read<NowPlayingCubit>().getNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('What do you want to watch?')),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextFormField(readOnly: true),
              const SizedBox(height: 16),
              BlocBuilder<TrendingCubit, TrendingState>(
                builder: (context, state) {
                  if (state is TrendingLoaded) {
                    return TrendingMoviesCarousalSlider(
                      trendingMovies: state.trendingMovies,
                    );
                  } else if (state is TrendingError) {
                    return Center(child: Text(state.message));
                  } else {
                    return Center(child: const CircularProgressIndicator());
                  }
                },
              ),
              const SizedBox(height: 16),
              TabBar(
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.symmetric(horizontal: 8),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Color(0xff92929D),
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                ),
                dividerHeight: 0,
                tabs: [
                  Tab(text: 'Now Playing'),
                  Tab(text: 'Upcoming'),
                  Tab(text: 'Top Rated'),
                  Tab(text: 'Popular'),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TabBarView(
                    children: [
                      BlocBuilder<NowPlayingCubit, NowPlayingState>(
                        builder: (context, state) {
                          if (state is NowPlayingLoaded) {
                            return MovieGridview(
                              movies: state.nowPlayingMovies,
                            );
                          } else if (state is NowPlayingError) {
                            return Center(child: Text(state.message));
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      BlocBuilder<UpcomingCubit, UpcomingState>(
                        builder: (context, state) {
                          if (state is UpcomingLoaded) {
                            return MovieGridview(movies: state.upcomingMovies);
                          } else if (state is UpcomingError) {
                            return Center(child: Text(state.message));
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),

                      BlocBuilder<TopRatedCubit, TopRatedState>(
                        builder: (context, state) {
                          if (state is TopRatedLoaded) {
                            return MovieGridview(movies: state.topRatedMovies);
                          } else if (state is TopRatedError) {
                            return Center(child: Text(state.message));
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      BlocBuilder<PopularCubit, PopularState>(
                        builder: (context, state) {
                          if (state is PopularLoaded) {
                            return MovieGridview(movies: state.popularMovies);
                          } else if (state is PopularError) {
                            return Center(child: Text(state.message));
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        routeName: HomeScreen.routeName,
        currentIndex: 0,
      ),
    );
  }
}
