import 'package:equatable/equatable.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object?> get props => [];
}

class LoadMovieDetailsEvent extends MovieDetailEvent {
  final int movieId;
  const LoadMovieDetailsEvent({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}