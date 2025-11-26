import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/features/detail/presentation/bloc/movie_detail_bloc.dart';
import 'package:movie_db/features/detail/presentation/bloc/movie_detail_state.dart';
import 'package:movie_db/features/detail/presentation/widgets/movie_detail_genres.dart';
import 'package:movie_db/features/detail/presentation/widgets/movie_detail_header.dart';
import 'package:movie_db/features/detail/presentation/widgets/movie_detail_info_panel.dart';

class MovieDetailScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Details')),
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailResult) {
            final movie = state.details;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieHeader(movie: movie),
                  MovieDetailInfoPanel(movie: movie),
                  MovieDetailGenres(genres: movie.genres),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(movie.overview),
                  ),
                ],
              ),
            );
          } else if (state is MovieDetailError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
