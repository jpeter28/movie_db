import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/features/search/domain/usecases/search_movie_usecase.dart';
import 'package:movie_db/features/search/presentation/bloc/search_movie_event.dart';
import 'package:movie_db/features/search/presentation/bloc/search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMoviesUseCase searchMoviesUseCase;

  SearchMovieBloc({required this.searchMoviesUseCase})
    : super(SearchMovieInitial()) {
    on<SearchMoviesEvent>(_onSearchMovies);
  }

  Future<void> _onSearchMovies(
    SearchMoviesEvent event,
    Emitter<SearchMovieState> emit,
  ) async {
    emit(SearchMovieLoading());
    try {
      final movies = await searchMoviesUseCase.execute(event.query);
      if (movies.isEmpty) {
        emit(SearchMovieEmpty());
      } else {
        emit(SearchMovieResult(movies: movies));
      }
    } catch (e) {
      emit(SearchMovieError(message: e.toString()));
    }
  }
}
