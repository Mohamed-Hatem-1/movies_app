import 'package:movies_app/models/movie_model.dart';

class NowPlayingState {}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  final List<MovieModel> nowPlayingMovies;
  NowPlayingLoaded(this.nowPlayingMovies);
}

class NowPlayingError extends NowPlayingState {
  final String message;

  NowPlayingError(this.message);
}
