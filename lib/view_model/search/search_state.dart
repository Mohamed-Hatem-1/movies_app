import 'package:movies_app/models/movie_model.dart';

class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<MovieModel> searchedMovies;
  SearchLoaded(this.searchedMovies);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
