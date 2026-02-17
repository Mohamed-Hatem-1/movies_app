import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrendingMoviesCarousalSlider extends StatelessWidget {
  final List<dynamic> trendingMovies;
  const TrendingMoviesCarousalSlider({super.key, required this.trendingMovies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: trendingMovies.length,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.25,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.40,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        enlargeFactor: 0.25,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            trendingMovies[index].posterPath != null
                ? 'https://image.tmdb.org/t/p/w500${trendingMovies[index].posterPath}'
                : 'https://via.placeholder.com/300',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
