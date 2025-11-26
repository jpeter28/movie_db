import 'package:movie_db/features/search/data/datasources/search_movie_data_source.dart';
import 'package:movie_db/features/search/data/models/movie_model.dart';

abstract class SearchMovieLocalDataSource implements SearchMovieDataSource {
  @override
  Future<List<MovieModel>> searchMovies(String query, int page);
  Future<void> cacheMovies(String query, List<MovieModel> movies);
}