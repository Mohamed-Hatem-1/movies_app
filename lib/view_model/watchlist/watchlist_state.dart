import 'package:movies_app/models/movie_model.dart';

abstract class WatchlistState {}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoading extends WatchlistState {}

class WatchlistLoaded extends WatchlistState {
  final List<MovieModel> movies;

  WatchlistLoaded(this.movies);
}

class WatchlistError extends WatchlistState {
  final String message;

  WatchlistError(this.message);
}

class WatchlistUpdated extends WatchlistState {
  final bool isAdded;

  WatchlistUpdated(this.isAdded);
}

class WatchlistAction extends WatchlistState {
  final bool isAdded;
  WatchlistAction(this.isAdded);
}
