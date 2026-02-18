import 'movie_model.dart';

class UpcomingDates {
  final String maximum;
  final String minimum;

  const UpcomingDates({required this.maximum, required this.minimum});

  factory UpcomingDates.fromJson(Map<String, dynamic> json) {
    return UpcomingDates(maximum: json['maximum'], minimum: json['minimum']);
  }
}

class UpcomingResponse {
  final UpcomingDates dates;
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  const UpcomingResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory UpcomingResponse.fromJson(Map<String, dynamic> json) {
    return UpcomingResponse(
      dates: UpcomingDates.fromJson(json['dates']),
      page: json['page'],
      results: List<MovieModel>.from(
        json['results'].map((x) => MovieModel.fromJson(x)),
      ),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
