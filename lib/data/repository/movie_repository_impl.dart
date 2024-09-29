import 'package:movie_app/data/datasource/movie_data_source.dart';
import 'package:movie_app/data/dto/movie_dto.dart';
import 'package:movie_app/domain/repository/moive_repository.dart';
import 'package:movie_app/data/mapper/movie_mapper.dart';
import '../../domain/model/movie.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;

  MovieRepositoryImpl(this._movieDataSource);

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final movie = await fetch();
      return movie.results!.map((e) => e.toMovie()).toList();
    } catch (e) {
      return throw Exception('');
    }
  }

  @override
  Future<MovieDto> fetch() async {
    try {
      final response = await _movieDataSource.fetch();
      return response;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
