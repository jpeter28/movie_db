import 'package:dio/dio.dart';
import 'package:movie_db/features/search/data/datasources/search_movie_data_source.dart';
import 'package:movie_db/features/search/data/models/movie_model.dart';

class SearchMovieRemoteDataSourceImpl implements SearchMovieDataSource {
  final Dio dio;

  SearchMovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    try {
      final response = await dio.get(
        '/search/movie',
        queryParameters: {'query': query},
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
