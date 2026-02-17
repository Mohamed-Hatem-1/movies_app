import 'package:movies_app/models/movie_model.dart';

class TopRatedState {}

class TopRatedInitial extends TopRatedState {}

class TopRatedLoading extends TopRatedState {}

class TopRatedLoaded extends TopRatedState {
  final List<MovieModel> topRatedMovies;
  TopRatedLoaded(this.topRatedMovies);
}

class TopRatedError extends TopRatedState {
  final String message;

  TopRatedError(this.message);
}
