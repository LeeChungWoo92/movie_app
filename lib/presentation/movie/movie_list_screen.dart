import 'package:flutter/material.dart';
import 'package:movie_app/presentation/component/movie_card_widget.dart';
import 'package:movie_app/presentation/movie/movie_list_ui_state.dart';
import 'package:movie_app/presentation/movie/movie_list_view_model.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MovieListViewModel>();
    final state = viewModel.state;

    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text(
              '개봉일',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              '${state.movieData!.dates!.minimum.toString()} ~ ${state.movieData!.dates!.maximum.toString()}',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: movieList(state),
            ),
          ],
        ));
  }

  Widget movieList(MovieListUiState state) {
    final movies = state.movie;

    return GridView.builder(
      shrinkWrap: true,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        if (state.isLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
        return MovieCardWidget(movie: movie);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
