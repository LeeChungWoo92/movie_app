import 'package:movie_app/data/datasource/movie_data_source.dart';
import 'package:movie_app/data/dto/movie_dto.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';
import 'package:movie_app/data/mapper/movie_mapper.dart';
import '../../domain/model/movie.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;

  MovieRepositoryImpl(this._movieDataSource);

  @override
  Future<List<Movie>> getMovies(int page) async {
    try {
      final movie = await fetch(page);
      return movie.results!.map((e) => e.toMovie()).toList();
    } catch (e) {
      return throw Exception('');
    }
  }

  @override
  Future<MovieDto> fetch(int page) async {
    try {
      final response = await _movieDataSource.fetch(page);
      return response;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
