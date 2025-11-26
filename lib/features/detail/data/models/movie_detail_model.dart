import 'package:movie_db/features/detail/domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.popularity,
    required super.voteAverage,
    required super.genres,
    required super.status,
    required super.language,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((g) => g['name'].toString())
          .toList() ??
          [],
      status: json['status'] ?? '',
      language: json['original_language'] ?? '',
    );
  }
}