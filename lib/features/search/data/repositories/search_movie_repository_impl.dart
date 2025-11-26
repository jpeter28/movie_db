import 'package:movie_db/features/search/data/datasources/search_movie_data_source.dart';
import 'package:movie_db/features/search/domain/entities/movie.dart';
import 'package:movie_db/features/search/domain/repositories/search_movie_repository.dart';

class SearchMovieRepositoryImpl implements SearchMovieRepository {
  final SearchMovieDataSource movieDataSource;

  SearchMovieRepositoryImpl({required this.movieDataSource});

  @override
  Future<List<Movie>> searchMovies(String query, int page) async {
    return await movieDataSource.searchMovies(query, page);
  }
}
