import 'package:flutter/material.dart';

class MovieDetailGenres extends StatelessWidget {
  final List<String> genres;

  const MovieDetailGenres({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: genres
            .map(
              (g) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Text(g, style: const TextStyle(fontSize: 12)),
              ),
            )
            .toList(),
      ),
    );
  }
}
