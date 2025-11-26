import 'package:movie_db/features/detail/domain/entities/movie_detail.dart';
import 'package:movie_db/features/detail/domain/repositories/movie_detail_repository.dart';

class MovieDetailUseCase {
  final MovieDetailRepository repository;

  MovieDetailUseCase(this.repository);

  Future<MovieDetail> execute(int movieId) {
    return repository.getMovieDetail(movieId);
  }
}