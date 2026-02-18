import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/view_model/watchlist/watchlist_cubit.dart';
import 'package:movies_app/view_model/watchlist/watchlist_state.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const routeName = '/movie-details';
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as MovieModel;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          "Movie Details",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          BlocConsumer<WatchlistCubit, WatchlistState>(
            listener: (context, state) {
              if (state is WatchlistAction) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.isAdded
                          ? 'Added to Watchlist 💖'
                          : 'Removed from Watchlist 💔',
                    ),
                    duration: Duration(seconds: 1),
                  ),
                );
              }
            },
            builder: (context, state) {
              final isAdded = context.watch<WatchlistCubit>().isInWatchlist(
                movie.id,
              );

              return IconButton(
                icon: Icon(
                  isAdded ? Icons.bookmark : Icons.bookmark_border_outlined,
                  color: isAdded ? Colors.blue : Colors.white,
                ),
                onPressed: () {
                  context.read<WatchlistCubit>().toggleWatchlist(movie);
                },
              );
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.38,
              child: Stack(
                children: [
                  Image.network(
                    "https://image.tmdb.org/t/p/w500/${movie.backdropPath}",
                  ),
                  Positioned(
                    bottom: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                              height: screenHeight * 0.25,
                              width: screenWidth * 0.30,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 18),
                          Column(
                            children: [
                              SizedBox(height: screenHeight * 0.125),
                              Text(
                                movie.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today_outlined, color: Color(0xff92929D)),
                SizedBox(width: 10),
                Text(
                  (movie.releaseDate.isNotEmpty &&
                          movie.releaseDate.length >= 4)
                      ? movie.releaseDate.substring(0, 4)
                      : 'N/A',
                  style: TextStyle(color: Color(0xff92929D)),
                ),
                SizedBox(width: 5),
                SizedBox(
                  height: 24,
                  child: VerticalDivider(color: Color(0xff92929D)),
                ),
                Icon(Icons.star_border_outlined, color: Color(0xff92929D)),
                SizedBox(width: 10),
                Text(
                  movie.voteAverage.toStringAsFixed(1).toString(),
                  style: TextStyle(color: Color(0xff92929D)),
                ),
                SizedBox(width: 5),
                SizedBox(
                  height: 24,
                  child: VerticalDivider(color: Color(0xff92929D)),
                ),
                Icon(Icons.local_attraction_outlined, color: Color(0xff92929D)),
                SizedBox(width: 10),
                Text("action", style: TextStyle(color: Color(0xff92929D))),
                SizedBox(width: 5),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white54,
                indicatorColor: Color(0xff92929D),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                tabs: [
                  Tab(text: "About Movie"),
                  Tab(text: "Reviews"),
                  Tab(text: "Cast"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      movie.overview,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
