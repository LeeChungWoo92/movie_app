import 'package:flutter/material.dart';
import 'package:movie_app/presentation/movie/movie_list_screen.dart';
import 'package:movie_app/presentation/movie/movie_list_view_model.dart';
import 'package:provider/provider.dart';

import '../../di/di_setup.dart';

class MovieListScreenRoot extends StatelessWidget {
  const MovieListScreenRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieListViewModel>(
      create: (_) => getIt<MovieListViewModel>(),
      child: Consumer<MovieListViewModel>(
        builder: (context, viewModel, child) {
          return const MovieListScreen();
        },
      ),
    );
  }
}
