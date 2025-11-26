import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_db/features/search/data/datasources/search_movie_data_source.dart';
import 'package:movie_db/features/search/data/datasources/remote/search_movie_remote_data_source.dart';
import 'package:movie_db/features/search/data/repositories/search_movie_repository_impl.dart';
import 'package:movie_db/features/search/domain/repositories/search_movie_repository.dart';
import 'package:movie_db/features/search/domain/usecases/search_movie_usecase.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<Dio>(() => _createDio());

  sl.registerLazySingleton<SearchMovieDataSource>(
    () => SearchMovieRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<SearchMovieRepository>(
    () => SearchMovieRepositoryImpl(movieDataSource: sl()),
  );

  sl.registerLazySingleton<SearchMoviesUseCase>(
    () => SearchMoviesUseCase(sl()),
  );
}

Dio _createDio() {
  final apiKey = dotenv.env['TMDB_API_KEY'] ?? '';
  final accessToken = dotenv.env['TMDB_ACCESS_TOKEN'] ?? '';
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer $accessToken',
      },
      queryParameters: {'api_key': apiKey},
    ),
  );

  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  dio.interceptors.add(
    RetryInterceptor(dio: dio, retries: 3, retryDelays: [Duration(seconds: 3)]),
  );

  return dio;
}
