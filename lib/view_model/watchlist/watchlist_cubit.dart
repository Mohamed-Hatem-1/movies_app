import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/movie_model.dart';
import '../../services/watchlist_service.dart';
import 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit() : super(WatchlistInitial());

  Future<void> loadWatchlist() async {
    emit(WatchlistLoading());
    try {
      final movies = await WatchlistService.getWatchlist();
      emit(WatchlistLoaded(movies));
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }

  Future<void> toggleWatchlist(MovieModel movie) async {
    final alreadyAdded = isInWatchlist(movie.id);

    if (alreadyAdded) {
      await WatchlistService.removeMovie(movie.id);
    } else {
      await WatchlistService.addMovie(movie);
    }

    emit(WatchlistAction(!alreadyAdded));

    await loadWatchlist();
  }

  bool isInWatchlist(int id) {
    final state = this.state;

    if (state is WatchlistLoaded) {
      return state.movies.any((movie) => movie.id == id);
    }
    return false;
  }

  Future<void> clearAll() async {
    await WatchlistService.clearWatchlist();
    emit(WatchlistLoaded([]));
  }
}
