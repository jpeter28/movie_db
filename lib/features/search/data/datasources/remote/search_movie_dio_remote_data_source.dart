import 'package:dio/dio.dart';
import 'package:movie_db/features/search/data/datasources/remote/search_movie_remote_data_source.dart';
import 'package:movie_db/features/search/data/models/movie_model.dart';

class SearchMovieDioRemoteDataSourceImpl implements SearchMovieRemoteDataSource {
  final Dio dio;

  SearchMovieDioRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<MovieModel>> searchMovies(String query, int page) async {
    try {
      final response = await dio.get(
        '/search/movie',
        queryParameters: {'query': query, 'page': page},
      );

      final results = response.data['results'] as List<dynamic>;
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
