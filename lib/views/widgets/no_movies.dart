import 'package:flutter/material.dart';

class NoMovies extends StatelessWidget {
  const NoMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/no-results 1.png'),
        const SizedBox(height: 16),
        Text(
          'We Are Sorry, We can\'t\n    find any movies.😥',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Find your movie by type title,\n     categories, years, etc.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
