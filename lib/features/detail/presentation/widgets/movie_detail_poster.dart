import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieDetailPoster extends StatelessWidget {
  final String posterPath;

  const MovieDetailPoster({super.key, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return posterPath.isNotEmpty
        ? ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/w200$posterPath',
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
              placeholder: (context, url) => const SizedBox(
                width: 80,
                height: 120,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => const SizedBox(
                width: 80,
                height: 120,
                child: Icon(Icons.error, size: 50),
              ),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const SizedBox(
              width: 80,
              height: 120,
              child: Icon(Icons.movie, size: 50),
            ),
          );
  }
}
