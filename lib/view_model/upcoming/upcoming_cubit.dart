import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/upcoming_response.dart';
import 'package:movies_app/view_model/upcoming/upcoming_state.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  UpcomingCubit() : super(UpcomingInitial());

  Future<void> getUpcomingMovies() async {
    emit(UpcomingLoading());
    try {
      final dio = Dio();
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1',
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZDYzNjQzM2E5YTRmYmVhNzE1NmIwMmNmMTc1OTg4NSIsIm5iZiI6MTc3MDQ1MzQxNC44NjgsInN1YiI6IjY5ODZmOWE2ODU3YmZhYTAyMTVjYTFlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UraNT83NpYeuGhBzSKFgx26DZ9RRuZlyrQ1nc_q0lTM',
            'accept': 'application/json',
          },
        ),
      );
      final upcomingResponse = UpcomingResponse.fromJson(response.data);
      emit(UpcomingLoaded(upcomingResponse.results));
    } catch (e) {
      log(e.toString());
      emit(UpcomingError(e.toString()));
    }
  }
}
