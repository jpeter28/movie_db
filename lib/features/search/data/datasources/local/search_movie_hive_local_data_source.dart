import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_db/features/search/data/datasources/local/search_movie_local_data_source.dart';
import 'package:movie_db/features/search/data/models/movie_model.dart';

class SearchMovieHiveLocalDataSourceImpl implements SearchMovieLocalDataSource {
  final Box _box;

  SearchMovieHiveLocalDataSourceImpl(this._box);

  @override
  Future<List<MovieModel>> searchMovies(String query, int page) async {
    final data = _box.get(query);
    if (data == null) return [];
    return (data as List)
        .map((json) => MovieModel.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  @override
  Future<void> cacheMovies(String query, List<MovieModel> movies) async {
    await _box.put(query, movies.map((m) => m.toJson()).toList());
  }
}