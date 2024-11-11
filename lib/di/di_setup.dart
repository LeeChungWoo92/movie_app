import 'package:get_it/get_it.dart';
import 'package:movie_app/data/datasource/movie_data_source.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';
import 'package:movie_app/presentation/movie/movie_list_view_model.dart';

import '../data/datasource/movie_data_source_impl.dart';
import '../data/repository/movie_repository_impl.dart';

final getIt = GetIt.instance;

void diSetUp() {
  //싱글턴
  getIt.registerSingleton<MovieDataSource>(MovieDataSourceImpl());
  getIt.registerSingleton<MovieRepository>(MovieRepositoryImpl(getIt()));
  //팩토리
  getIt.registerFactory<MovieListViewModel>(() => MovieListViewModel(getIt()));
}
