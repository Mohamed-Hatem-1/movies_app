import 'package:movies_app/models/movie_model.dart';

class SearchMovieResponse {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  SearchMovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchMovieResponse.fromJson(Map<String, dynamic> json) {
    return SearchMovieResponse(
      page: json['page'],
      results: List<MovieModel>.from(
        json['results'].map((x) => MovieModel.fromJson(x)),
      ),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': List<dynamic>.from(results.map((x) => x.toJson())),
        'total_pages': totalPages,
        'total_results': totalResults,
      };
}
