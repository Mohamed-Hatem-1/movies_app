import 'movie_model.dart';

class TopRatedResponse {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  const TopRatedResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TopRatedResponse.fromJson(Map<String, dynamic> json) {
    return TopRatedResponse(
      page: json['page'],
      results: List<MovieModel>.from(
        json['results'].map((x) => MovieModel.fromJson(x)),
      ),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
