import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double popularity;
  final double voteAverage;
  final List<String> genres;
  final String status;
  final String language;

  const MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.popularity,
    required this.voteAverage,
    required this.genres,
    required this.status,
    required this.language,
  });

  @override
  List<Object?> get props => [id, title, overview, posterPath, voteAverage, popularity, genres, status, language];
}