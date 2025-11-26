import 'package:movie_db/features/detail/data/datasources/movie_detail_data_source.dart';
import 'package:movie_db/features/detail/domain/entities/movie_detail.dart';
import 'package:movie_db/features/detail/domain/repositories/movie_detail_repository.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository {
  final MovieDetailDataSource dataSource;

  MovieDetailRepositoryImpl({required this.dataSource});

  @override
  Future<MovieDetail> getMovieDetail(int movieId) {
    return dataSource.getMovieDetail(movieId);
  }
}