import 'package:flutter/material.dart';
import 'package:movie_app/presentation/component/movie_card_widget.dart';
import 'package:movie_app/presentation/movie/movie_list_view_model.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: movieList(context),
    );
  }

  Widget movieList(BuildContext context) {
    final viewModel = context.watch<MovieListViewModel>();
    final movies = viewModel.state.movie;
    return GridView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        print('무비:$movie');
        if (viewModel.state.isLoading) {
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
