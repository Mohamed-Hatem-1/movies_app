import 'package:movies_app/models/movie_model.dart';

class PopularState {}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularLoaded extends PopularState {
  final List<MovieModel> popularMovies;
  PopularLoaded(this.popularMovies);
}

class PopularError extends PopularState {
  final String message;

  PopularError(this.message);
}
