import 'package:flutter/material.dart';
import 'package:movie_app/presentation/component/movie_card_widget.dart';
import 'package:movie_app/presentation/movie/movie_list_ui_state.dart';
import 'package:movie_app/presentation/movie/movie_list_view_model.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({
    super.key,
  });

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  late ScrollController _scrollController;
  late MovieListViewModel viewModel;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    // viewModel 초기화 및 초기 데이터 로드
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel = context.read<MovieListViewModel>();
      viewModel.fetchMovies();
    });
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final viewModel = context.read<MovieListViewModel>();
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent &&
        !viewModel.state.isLoading) {
      viewModel.fetchMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MovieListViewModel>().state;

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
              '${state.movieData?.dates?.minimum ?? ''} ~ ${state.movieData?.dates?.maximum ?? ''}',
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
      controller: _scrollController,
      itemCount: movies.length + (state.isLoading ? 1 : 0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        if (index == movies.length && state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final movie = movies[index];
        return MovieCardWidget(movie: movie);
      },
    );
  }
}
