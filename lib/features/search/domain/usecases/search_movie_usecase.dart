import 'package:movie_db/features/search/domain/entities/movie.dart';
import 'package:movie_db/features/search/domain/repositories/search_movie_repository.dart';

class SearchMoviesUseCase {
  final SearchMovieRepository repository;

  SearchMoviesUseCase(this.repository);

  Future<List<Movie>> execute(String query, int page) async {
    return await repository.searchMovies(query, page);
  }
}
