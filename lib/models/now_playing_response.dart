import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/models/now_playing_dates.dart';

class NowPlayingResponse {
  final NowPlayingDates dates;
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  NowPlayingResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) {
    return NowPlayingResponse(
      dates: NowPlayingDates.fromJson(json['dates']),
      page: json['page'],
      results: List<MovieModel>.from(
        json['results'].map((x) => MovieModel.fromJson(x)),
      ),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
