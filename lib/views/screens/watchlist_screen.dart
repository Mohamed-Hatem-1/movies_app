import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/view_model/watchlist/watchlist_cubit.dart';
import 'package:movies_app/view_model/watchlist/watchlist_state.dart';
import 'package:movies_app/views/widgets/my_bottom_navigationbar.dart';
import 'package:movies_app/views/widgets/no_watchlist.dart';
import 'package:movies_app/views/widgets/watchlist_movie_item.dart';

class WatchlistScreen extends StatefulWidget {
  static const routeName = '/watchlist';

  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WatchlistCubit>().loadWatchlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Watchlist',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            onPressed: () => _showClearDialog(context),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: BlocBuilder<WatchlistCubit, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WatchlistLoaded) {
            if (state.movies.isEmpty) {
              return const NoWatchlist();
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return WatchlistMovieItem(movie: movie);
              },
            );
          }

          if (state is WatchlistError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        routeName: WatchlistScreen.routeName,
        currentIndex: 2,
      ),
    );
  }
}

void _showClearDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: Colors.grey[900],
      title: const Text(
        'Clear Watchlist',
        style: TextStyle(color: Colors.white),
      ),
      content: const Text(
        'Are you sure you want to remove all movies from your watchlist?',
        style: TextStyle(color: Colors.white70),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            context.read<WatchlistCubit>().clearAll();
            Navigator.pop(context);
          },
          child: const Text(
            'Delete',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ],
    ),
  );
}
