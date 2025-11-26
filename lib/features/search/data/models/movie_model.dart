import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_db/features/search/domain/entities/movie.dart';

@HiveType(typeId: 1)
class MovieModel extends Movie {
  const MovieModel({
    @HiveField(0) required super.id,
    @HiveField(1) required super.title,
    @HiveField(2) required super.overview,
    @HiveField(3) required super.posterPath,
    @HiveField(4) required super.voteAverage,
    @HiveField(5) required super.popularity,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      popularity: (json['popularity'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'overview': overview,
    'poster_path': posterPath,
    'vote_average': voteAverage,
    'popularity': popularity,
  };
}
