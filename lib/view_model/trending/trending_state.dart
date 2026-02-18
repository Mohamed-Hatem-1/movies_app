import 'package:movies_app/models/movie_model.dart';

class TrendingState {}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingLoaded extends TrendingState {
  final List<MovieModel> trendingMovies;
  TrendingLoaded(this.trendingMovies);
}

class TrendingError extends TrendingState {
  final String message;

  TrendingError(this.message);
}
