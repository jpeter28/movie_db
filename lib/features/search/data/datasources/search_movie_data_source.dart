import 'package:movie_db/features/search/data/models/movie_model.dart';

abstract class SearchMovieDataSource {
  Future<List<MovieModel>> searchMovies(String query, int page);
}
