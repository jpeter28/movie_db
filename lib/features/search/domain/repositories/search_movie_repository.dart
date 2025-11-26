import 'package:movie_db/features/search/domain/entities/movie.dart';

abstract class SearchMovieRepository {
  Future<List<Movie>> searchMovies(String query);
}
