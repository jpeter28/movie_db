import 'package:dio/dio.dart';
import 'package:movie_db/features/detail/data/datasources/movie_detail_data_source.dart';
import 'package:movie_db/features/detail/data/models/movie_detail_model.dart';

class MovieDetailRemoteDataSourceImpl implements MovieDetailDataSource {
  final Dio dio;

  MovieDetailRemoteDataSourceImpl({required this.dio});

  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    try {
      final response = await dio.get('/movie/$movieId');
      return MovieDetailModel.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}