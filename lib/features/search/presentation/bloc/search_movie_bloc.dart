import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/features/search/domain/entities/movie.dart';
import 'package:movie_db/features/search/domain/usecases/search_movie_usecase.dart';
import 'package:movie_db/features/search/presentation/bloc/search_movie_event.dart';
import 'package:movie_db/features/search/presentation/bloc/search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMoviesUseCase searchMoviesUseCase;
  int _pageIndex = 1;
  String _query = '';
  List<Movie> _movies = [];

  SearchMovieBloc({required this.searchMoviesUseCase})
    : super(SearchMovieInitial()) {

    on<SearchMoviesEvent>((event, emit) async{
      emit(SearchMovieLoading());
      _query = event.query;
      _pageIndex = 1;
      try {
        final movies = await searchMoviesUseCase.execute(_query, _pageIndex);
        if (movies.isEmpty) {
          emit(SearchMovieEmpty());
        } else {
          emit(SearchMovieResult(movies: movies));
        }
      } catch (e) {
        emit(SearchMovieError(message: e.toString()));
      }
    },);

    on<LoadMoreMoviesEvent>((event, emit) async {
      _pageIndex++;
      try {
        final result = await searchMoviesUseCase.execute(_query, _pageIndex);
        _movies = [..._movies, ...result];
        emit(SearchMovieResult(movies: _movies));
      } catch (e) {
        emit(SearchMovieError(message: e.toString()));
      }
    });
  }
}
