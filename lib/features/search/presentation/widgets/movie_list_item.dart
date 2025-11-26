import 'package:flutter/material.dart';
import 'package:movie_db/features/search/domain/entities/movie.dart';
import 'package:movie_db/features/search/presentation/widgets/movie_info.dart';
import 'package:movie_db/features/search/presentation/widgets/movie_poster.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;

  const MovieListItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoviePoster(posterPath: movie.posterPath),
            const SizedBox(width: 20),
            MovieInfo(movie: movie),
          ],
        ),
      ),
    );
  }
}
