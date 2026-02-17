import 'package:movies_app/models/movie_model.dart';

class UpcomingState {}

class UpcomingInitial extends UpcomingState {}

class UpcomingLoading extends UpcomingState {}

class UpcomingLoaded extends UpcomingState {
  final List<MovieModel> upcomingMovies;
  UpcomingLoaded(this.upcomingMovies);
}

class UpcomingError extends UpcomingState {
  final String message;
  UpcomingError(this.message);
}
