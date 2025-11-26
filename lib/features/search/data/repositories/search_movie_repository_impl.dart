import 'package:movie_db/features/search/data/datasources/local/search_movie_local_data_source.dart';
import 'package:movie_db/features/search/data/datasources/remote/search_movie_remote_data_source.dart';
import 'package:movie_db/features/search/domain/entities/movie.dart';
import 'package:movie_db/features/search/domain/repositories/search_movie_repository.dart';

class SearchMovieRepositoryImpl implements SearchMovieRepository {
  final SearchMovieRemoteDataSource remoteDataSource;
  final SearchMovieLocalDataSource localDataSource;

  SearchMovieRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<List<Movie>> searchMovies(String query, int page) async {
    try {
      final movies = await remoteDataSource.searchMovies(query, page);
      if (page == 1) {
        await localDataSource.cacheMovies(query, movies);
      }

      return movies;
    } catch (_) {
      final cached = await localDataSource.searchMovies(query, page);
      if (cached.isNotEmpty) return cached;
      rethrow;
    }
  }
}
