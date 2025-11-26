import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/features/detail/domain/usecases/movie_detail_usecase.dart';
import 'package:movie_db/features/detail/presentation/bloc/movie_detail_event.dart';
import 'package:movie_db/features/detail/presentation/bloc/movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieDetailUseCase movieDetailUseCase;

  MovieDetailBloc({required this.movieDetailUseCase}) : super(MovieDetailInitial()) {
    on<LoadMovieDetailsEvent>((event, emit) async {
      emit(MovieDetailLoading());
      try {
        final details = await movieDetailUseCase.execute(event.movieId);
        emit(MovieDetailResult(details: details));
      } catch (e) {
        emit(MovieDetailError(message: e.toString()));
      }
    });
  }
}