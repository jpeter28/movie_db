import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_db/core/di/injection_manager.dart';
import 'package:movie_db/features/search/domain/usecases/search_movie_usecase.dart';
import 'package:movie_db/features/search/presentation/bloc/search_movie_bloc.dart';
import 'package:movie_db/features/search/presentation/screens/search_movie_screen.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (_) =>
              SearchMovieBloc(searchMoviesUseCase: sl<SearchMoviesUseCase>()),
          child: const SearchMovieScreen(),
        ),
      ),
    ],
  );
}
