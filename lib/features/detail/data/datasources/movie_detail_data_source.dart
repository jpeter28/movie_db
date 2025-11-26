import 'package:movie_db/features/detail/data/models/movie_detail_model.dart';

abstract class MovieDetailDataSource {
  Future<MovieDetailModel> getMovieDetail(int movieId);
}