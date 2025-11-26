import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/features/search/presentation/bloc/search_movie_bloc.dart';
import 'package:movie_db/features/search/presentation/bloc/search_movie_event.dart';
import 'package:movie_db/features/search/presentation/bloc/search_movie_state.dart';
import 'package:movie_db/features/search/presentation/widgets/movie_list_item.dart';

class SearchMovieScreen extends StatelessWidget {
  const SearchMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchMovieBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text('Search Movies')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 12,
                ),
              ),
              onChanged: (query) {
                if (query.isNotEmpty) {
                  bloc.add(SearchMoviesEvent(query));
                }
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchMovieBloc, SearchMovieState>(
              builder: (context, state) {
                if (state is SearchMovieInitial) {
                  return const Center(
                    child: Text('Type to search for movies..'),
                  );
                } else if (state is SearchMovieLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchMovieResult) {
                  return ListView.builder(
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      final movie = state.movies[index];
                      return MovieListItem(movie: movie);
                    },
                  );
                } else if (state is SearchMovieEmpty) {
                  return const Center(child: Text('No movies found'));
                } else if (state is SearchMovieError) {
                  return Center(
                    child: Text(
                      'Error: ${state.message}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.redAccent,
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
