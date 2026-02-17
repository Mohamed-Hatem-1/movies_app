class TrendingItem {
  final bool adult;
  final String? backdropPath;
  final int id;
  final String? title;
  final String? name;
  final String? originalTitle;
  final String? originalName;
  final String overview;
  final String? posterPath;
  final String mediaType;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final String? releaseDate;
  final String? firstAirDate;
  final bool? video;
  final double voteAverage;
  final int voteCount;
  final List<String>? originCountry;

  TrendingItem({
    required this.adult,
    this.backdropPath,
    required this.id,
    this.title,
    this.name,
    this.originalTitle,
    this.originalName,
    required this.overview,
    this.posterPath,
    required this.mediaType,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    this.releaseDate,
    this.firstAirDate,
    this.video,
    required this.voteAverage,
    required this.voteCount,
    this.originCountry,
  });

  factory TrendingItem.fromJson(Map<String, dynamic> json) {
    return TrendingItem(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      id: json['id'] ?? 0,
      title: json['title'],
      name: json['name'],
      originalTitle: json['original_title'],
      originalName: json['original_name'],
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      mediaType: json['media_type'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      releaseDate: json['release_date'],
      firstAirDate: json['first_air_date'],
      video: json['video'],
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
      originCountry: json['origin_country'] != null
          ? List<String>.from(json['origin_country'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'id': id,
      'title': title,
      'name': name,
      'original_title': originalTitle,
      'original_name': originalName,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'popularity': popularity,
      'release_date': releaseDate,
      'first_air_date': firstAirDate,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'origin_country': originCountry,
    };
  }
}
