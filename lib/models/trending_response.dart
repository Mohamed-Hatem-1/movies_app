import 'trending_item.dart';

class TrendingResponse {
  final int page;
  final List<TrendingItem> results;
  final int totalPages;
  final int totalResults;

  TrendingResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TrendingResponse.fromJson(Map<String, dynamic> json) {
    return TrendingResponse(
      page: json['page'] ?? 0,
      results: (json['results'] as List<dynamic>? ?? [])
          .map((e) => TrendingItem.fromJson(e))
          .toList(),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }
}
