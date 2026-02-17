import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';

class SearchedMovie extends StatelessWidget {
  final MovieModel movie;
  const SearchedMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                movie.posterPath != null
                    ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                    : 'https://th.bing.com/th/id/OIP.3dQJdd3puXqdw9pDmNrK4QHaH0?w=167&h=180&c=7&r=0&o=7&cb=defcachec2&dpr=1.3&pid=1.7&rm=3',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 24),
                    const SizedBox(width: 4),
                    Text(movie.voteAverage.toStringAsFixed(1)),
                    const SizedBox(width: 6),
                    Text(
                      '(${movie.voteCount})',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '📅 ${movie.releaseDate}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
