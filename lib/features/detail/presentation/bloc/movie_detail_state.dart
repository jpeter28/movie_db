import 'package:equatable/equatable.dart';
import 'package:movie_db/features/detail/domain/entities/movie_detail.dart';

sealed class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object?> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}
class MovieDetailLoading extends MovieDetailState {}
class MovieDetailResult extends MovieDetailState {
  final MovieDetail details;
  const MovieDetailResult({required this.details});

  @override
  List<Object?> get props => [details];
}
class MovieDetailError extends MovieDetailState {
  final String message;
  const MovieDetailError({required this.message});

  @override
  List<Object?> get props => [message];
}