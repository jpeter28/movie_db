import 'package:movie_db/features/detail/domain/entities/movie_detail.dart';

abstract class MovieDetailRepository {
  Future<MovieDetail> getMovieDetail(int movieId);
}