import 'movie_model.dart';

class PopularResponse {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  const PopularResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularResponse.fromJson(Map<String, dynamic> json) {
    return PopularResponse(
      page: json['page'],
      results: List<MovieModel>.from(
        json['results'].map((x) => MovieModel.fromJson(x)),
      ),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
