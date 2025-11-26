import 'package:flutter/material.dart';
import 'package:movie_db/features/search/domain/entities/movie.dart';

class MovieInfo extends StatelessWidget {
  final Movie movie;

  const MovieInfo({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.star, size: 16, color: Colors.amber),
              const SizedBox(width: 5),
              Text(
                movie.voteAverage.toStringAsFixed(1),
                style: const TextStyle(fontSize: 14, color: Colors.amber),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.favorite, size: 16, color: Colors.redAccent),
              const SizedBox(width: 5),
              Text(
                movie.popularity.toStringAsFixed(3),
                style: const TextStyle(fontSize: 14, color: Colors.redAccent),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            movie.overview,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
