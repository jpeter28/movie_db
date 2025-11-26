import 'package:equatable/equatable.dart';
import 'package:movie_db/features/search/domain/entities/movie.dart';

sealed class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object> get props => [];
}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieLoading extends SearchMovieState {}

class SearchMovieResult extends SearchMovieState {
  final List<Movie> movies;

  const SearchMovieResult({required this.movies});

  @override
  List<Object> get props => [movies];
}

class SearchMovieEmpty extends SearchMovieState {}

class SearchMovieError extends SearchMovieState {
  final String message;

  const SearchMovieError({required this.message});

  @override
  List<Object> get props => [message];
}
