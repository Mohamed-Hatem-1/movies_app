import 'package:flutter/material.dart';

class SearchedMovie extends StatelessWidget {
  const SearchedMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset('assets/images/movie-1.png', fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Spider Man No Way Home',
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(flex: 2),
                const Text('⭐ 9.5 / 10'),
                const Spacer(flex: 1),
                const Text('🎬 Action'),
                const Spacer(flex: 1),
                const Text('📅 2021'),
                const Spacer(flex: 1),
                const Text('⏳ 2h 28min'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
