import 'package:movies_app/models/trending_item.dart';

class TrendingState {}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingLoaded extends TrendingState {
  final List<TrendingItem> trendingMovies;
  TrendingLoaded(this.trendingMovies);
}

class TrendingError extends TrendingState {
  final String message;

  TrendingError(this.message);
}
