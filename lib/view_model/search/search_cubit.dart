import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/search_movie_response.dart';
import 'package:movies_app/view_model/search/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> getSearchMovies(String name) async {
    emit(SearchLoading());
    try {
      final dio = Dio();
      final response = await dio.get(
        'https://api.themoviedb.org/3/search/movie',
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZDYzNjQzM2E5YTRmYmVhNzE1NmIwMmNmMTc1OTg4NSIsIm5iZiI6MTc3MDQ1MzQxNC44NjgsInN1YiI6IjY5ODZmOWE2ODU3YmZhYTAyMTVjYTFlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UraNT83NpYeuGhBzSKFgx26DZ9RRuZlyrQ1nc_q0lTM',
            'accept': 'application/json',
          },
        ),
        queryParameters: {
          'query': name,
          'include_adult': false,
          'language': 'en-US',
          'page': 1,
        },
      );
      final searchResponse = SearchMovieResponse.fromJson(response.data);
      log(searchResponse.results[0].toString());
      emit(SearchLoaded(searchResponse.results));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
