import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/top_rated_response.dart';
import 'package:movies_app/view_model/top_rated/top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit() : super(TopRatedInitial());

  Future<void> getTopRatedMovies() async {
    emit(TopRatedLoading());
    try {
      final dio = Dio();
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1',
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZDYzNjQzM2E5YTRmYmVhNzE1NmIwMmNmMTc1OTg4NSIsIm5iZiI6MTc3MDQ1MzQxNC44NjgsInN1YiI6IjY5ODZmOWE2ODU3YmZhYTAyMTVjYTFlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UraNT83NpYeuGhBzSKFgx26DZ9RRuZlyrQ1nc_q0lTM',
            'accept': 'application/json',
          },
        ),
        // queryParameters: {
        //   'query': name,
        //   'include_adult': false,
        //   'language': 'en-US',
        //   'page': 1,
        // },
      );
      final topRatedResponse = TopRatedResponse.fromJson(response.data);
      emit(TopRatedLoaded(topRatedResponse.results));
    } catch (e) {
      emit(TopRatedError(e.toString()));
    }
  }
}
