import 'package:flutter/material.dart';
import 'package:movie_db/features/detail/domain/entities/movie_detail.dart';
import 'package:movie_db/features/detail/presentation/widgets/movie_detail_info.dart';

class MovieDetailInfoPanel extends StatelessWidget {
  final MovieDetail movie;

  const MovieDetailInfoPanel({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          MovieDetailInfo(label: 'Status', value: movie.status,),
          MovieDetailInfo(
            label: 'Popularity',
            value: movie.popularity.toStringAsFixed(1),
          ),
          MovieDetailInfo(label: 'Language', value: movie.language.toUpperCase()),
        ],
      ),
    );
  }
}
