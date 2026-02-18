import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/trending_response.dart';
import 'package:movies_app/view_model/trending/trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingInitial());

  Future<void> fetchHomeCarousalSliderMovies() async {
    emit(TrendingLoading());
    try {
      final dio = Dio();
      final response = await dio.get(
        'https://api.themoviedb.org/3/trending/all/day?language=en-US',
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
      // log(response.data['results'][0].toString());
      final trendingResponse = TrendingResponse.fromJson(response.data);
      emit(TrendingLoaded(trendingResponse.results));
    } catch (e) {
      emit(TrendingError(e.toString()));
    }
  }
}
