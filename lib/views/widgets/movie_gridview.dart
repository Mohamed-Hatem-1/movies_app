import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';

class MovieGridview extends StatelessWidget {
    final List<MovieModel> movies;


  const MovieGridview({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 12),
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (context, index) {
                final movie = movies[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        );
      },
    );
  }
}
