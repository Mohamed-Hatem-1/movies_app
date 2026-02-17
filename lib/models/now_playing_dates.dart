class NowPlayingDates {
  final String maximum;
  final String minimum;

  const NowPlayingDates({required this.maximum, required this.minimum});

  factory NowPlayingDates.fromJson(Map<String, dynamic> json) {
    return NowPlayingDates(maximum: json['maximum'], minimum: json['minimum']);
  }
}
